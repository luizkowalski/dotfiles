package main

import (
	"encoding/json"
	"fmt"
	"net"
	"os"
	"time"

	"github.com/charmbracelet/bubbles/spinner"
	tea "github.com/charmbracelet/bubbletea"
	"github.com/charmbracelet/lipgloss"
)

const (
	hostIP   = "192.168.178.20"
	hostPort = "38899"
)

// Styles
var (
	titleStyle = lipgloss.NewStyle().
			Bold(true).
			Foreground(lipgloss.Color("#FAFAFA")).
			Background(lipgloss.Color("#7D56F4")).
			PaddingLeft(2).
			PaddingRight(2).
			MarginBottom(1)

	statusStyle = lipgloss.NewStyle().
			Foreground(lipgloss.Color("#FAFAFA")).
			PaddingLeft(2)

	// successStyle = lipgloss.NewStyle().Foreground(lipgloss.Color("#73F59F"))

	errorStyle = lipgloss.NewStyle().
			Foreground(lipgloss.Color("#F27E8D"))

	onStyle = lipgloss.NewStyle().
		Foreground(lipgloss.Color("#73F59F")).
		Bold(true)

	offStyle = lipgloss.NewStyle().
			Foreground(lipgloss.Color("#FF5555")).
			Bold(true)

	arrowStyle = lipgloss.NewStyle().
			Foreground(lipgloss.Color("#5CADF0")).
			Bold(true)
)

// Messages
type fetchStateMsg struct{ state bool }
type fetchStateErrMsg struct{ err error }
type toggleStateMsg struct{ success bool }
type delayMsg struct{}

// BulbModel holds the application state
type BulbModel struct {
	spinner       spinner.Model
	fetchingState bool
	togglingState bool
	state         bool
	newState      bool
	stateText     string
	newStateText  string
	errorMsg      string
	width         int
	height        int
	completed     bool
}

// Command to fetch the current state
func fetchStateCmd() tea.Cmd {
	return func() tea.Msg {
		// Create a connection to the UDP endpoint
		conn, err := net.Dial("udp", net.JoinHostPort(hostIP, hostPort))
		if err != nil {
			return fetchStateErrMsg{err}
		}
		defer conn.Close()

		// Send the get state command
		getPilotCmd := map[string]interface{}{
			"id":     1,
			"method": "getPilot",
			"params": map[string]interface{}{},
		}
		cmdJSON, _ := json.Marshal(getPilotCmd)

		_, err = conn.Write(cmdJSON)
		if err != nil {
			return fetchStateErrMsg{err}
		}

		// Set a read deadline
		conn.SetReadDeadline(time.Now().Add(3 * time.Second))

		// Read the response
		buffer := make([]byte, 1024)
		n, err := conn.Read(buffer)
		if err != nil {
			return fetchStateErrMsg{err}
		}

		// Parse the response
		var response map[string]interface{}
		err = json.Unmarshal(buffer[:n], &response)
		if err != nil {
			return fetchStateErrMsg{err}
		}

		// Extract the state
		result, ok := response["result"].(map[string]interface{})
		if !ok {
			return fetchStateErrMsg{fmt.Errorf("unable to parse response")}
		}

		stateVal, ok := result["state"].(bool)
		if !ok {
			return fetchStateErrMsg{fmt.Errorf("unable to parse state")}
		}

		return fetchStateMsg{state: stateVal}
	}
}

// Command to toggle the bulb state
func toggleStateCmd(newState bool) tea.Cmd {
	return func() tea.Msg {
		// Create a connection to the UDP endpoint
		conn, err := net.Dial("udp", net.JoinHostPort(hostIP, hostPort))
		if err != nil {
			return fetchStateErrMsg{err}
		}
		defer conn.Close()

		// Prepare the set state command
		setStateCmd := map[string]interface{}{
			"id":     1,
			"method": "setState",
			"params": map[string]interface{}{
				"state": newState,
			},
		}
		cmdJSON, _ := json.Marshal(setStateCmd)

		// Send the command
		_, err = conn.Write(cmdJSON)
		if err != nil {
			return fetchStateErrMsg{err}
		}

		return toggleStateMsg{success: true}
	}
}

// Add a delay command to briefly show the final state before quitting
func delayCmd() tea.Cmd {
	return tea.Tick(time.Millisecond*200, func(t time.Time) tea.Msg {
		return delayMsg{}
	})
}

func initialModel() BulbModel {
	s := spinner.New()
	s.Spinner = spinner.Dot
	s.Style = lipgloss.NewStyle().Foreground(lipgloss.Color("#7D56F4"))

	return BulbModel{
		spinner:       s,
		fetchingState: true,
		togglingState: false,
		state:         false,
		newState:      false,
		stateText:     "Unknown",
		newStateText:  "Unknown",
		errorMsg:      "",
		completed:     false,
	}
}

func (m BulbModel) Init() tea.Cmd {
	return tea.Batch(
		m.spinner.Tick,
		fetchStateCmd(),
	)
}

func (m BulbModel) Update(msg tea.Msg) (tea.Model, tea.Cmd) {
	var cmd tea.Cmd

	switch msg := msg.(type) {
	case tea.KeyMsg:
		if msg.String() == "q" || msg.String() == "ctrl+c" {
			return m, tea.Quit
		}

	case tea.WindowSizeMsg:
		m.width = msg.Width
		m.height = msg.Height

	case spinner.TickMsg:
		var spinnerCmd tea.Cmd
		m.spinner, spinnerCmd = m.spinner.Update(msg)
		return m, spinnerCmd

	case fetchStateMsg:
		m.fetchingState = false
		m.state = msg.state
		m.newState = !msg.state // Immediately set the target new state

		stateMap := map[bool]string{true: "ON", false: "OFF"}

		m.stateText = stateMap[m.state]
		m.newStateText = stateMap[m.newState]

		// Automatically proceed to toggling the state
		m.togglingState = true
		return m, tea.Batch(
			m.spinner.Tick,
			toggleStateCmd(m.newState),
		)

	case fetchStateErrMsg:
		m.fetchingState = false
		m.errorMsg = fmt.Sprintf("Error: %v", msg.err)
		return m, tea.Quit

	case toggleStateMsg:
		m.togglingState = false
		m.completed = true
		// Don't quit immediately - show the final state with a delay
		return m, delayCmd()

	case delayMsg:
		// After the delay, quit the program
		return m, tea.Quit
	}

	return m, cmd
}

func (m BulbModel) View() string {
	title := titleStyle.Render("💡 Smart Bulb Controller 💡")

	var statusText string

	if m.errorMsg != "" {
		return fmt.Sprintf("%s\n\n%s\n\n", title, errorStyle.Render(m.errorMsg))
	}

	if m.fetchingState {
		statusText = fmt.Sprintf("%s Checking bulb status...", m.spinner.View())
	} else if m.togglingState {
		stateStyle := offStyle
		if m.state {
			stateStyle = onStyle
		}

		newStateStyle := offStyle
		if m.newState {
			newStateStyle = onStyle
		}

		statusText = fmt.Sprintf("%s Current state: %s %s Changing to: %s",
			m.spinner.View(),
			stateStyle.Render(m.stateText),
			arrowStyle.Render("→"),
			newStateStyle.Render(m.newStateText))
	} else if m.completed {
		stateStyle := offStyle
		if m.state {
			stateStyle = onStyle
		}

		newStateStyle := offStyle
		if m.newState {
			newStateStyle = onStyle
		}

		statusText = fmt.Sprintf("Changed state from %s %s %s",
			stateStyle.Render(m.stateText),
			arrowStyle.Render("→"),
			newStateStyle.Render(m.newStateText))
	}

	return fmt.Sprintf("%s\n\n%s\n",
		title,
		statusStyle.Render(statusText),
	)
}

func main() {
	p := tea.NewProgram(initialModel())
	if _, err := p.Run(); err != nil {
		fmt.Printf("Error running program: %v\n", err)
		os.Exit(1)
	}
}
