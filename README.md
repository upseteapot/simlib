# Simlib
## Modes
- RUN:    Draws content only on screen buffer. Does not render video.
- RENDER: Draws content only in target buffer. Simulation duration is required.
- BOTH:   Draws content in target buffer and screen buffer. Simulation video ends when the window is closed.
## Example
```c
int main(int argc, char **argv)
{   
    int world_width  = 1280;
    int world_height = 720;

    SimulationState simulation_state;
    CreateSimulationState(&simulation_state, BOTH, 1920, 1080, 10);
    // ParseSimulationState(&simulation_state, argc, argv);
    InitSimulation(&simulation_state, (Vector2){world_width, world_height}, "Simlib");

    while (!WindowShouldClose())
    {
        BeginSimulationMode(&simulation_state);
        
        // Update and render simulation with raylib.
        
        if(!EndSimulationMode(&simulation_state))
            break;
    }

    CloseSimulation(simulation_state);
    
    return 0;
}
```
## Usage
```c
void CreateSimulationState(SimulationState *sim_state, enum Mode mode, int target_resolution_width, int target_resolution_height, int fps, int duration);
void ParseSimulationState(SimulationState *sim_state, int argc, char **argv);
void InitSimulation(SimulationState *sim_state, Vector2 start_view, const char *title);
void BeginSimulationMode(SimulationState *sim_state, Color clear_color);
int  EndSimulationMode(SimulationState *sim_state);
void CloseSimulation(SimulationState *sim_state);
```
## Parser
```bash
./main [MODE] [WIDTH] [HEIGHT] [FPS] [DURATION (only in render mode)]
```
