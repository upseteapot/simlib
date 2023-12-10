# Simlib
## Modes
- RUN:    Draws content only on screen buffer. Does not render video.
- RENDER: Draws content only in target buffer. Simulation duration is required.
- BOTH:   Draws content in target buffer and screen buffer. Simulation video ends when the window is closed.
## Usage
```c
int main(int argc, char **argv)
{   
    int world_width  = 1280;
    int world_height = 720;

    SimulationState simulation_state;
    CreateSimulationState(&simulation_state, BOTH, 1920, 1080, 10);
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
