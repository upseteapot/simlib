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
    CreateSimulationState(&simulation_state, BOTH, 1920, 1080, 60, 10);
    // ParseSimulationState(&simulation_state, argc, argv);
    InitSimulation(&simulation_state, (Vector2){world_width, world_height}, "Simlib");

    while (!WindowShouldClose())
    {
        BeginSimulationMode(&simulation_state, BLACK);

        // Update and render your simulation with raylib.

        if (!EndSimulationMode(&simulation_state))
            break;
    }

    CloseSimulation(&simulation_state);
    
    return 0;
}
```
## Parser
Simlib comes with a parser so that you can change the parameters of the simulation at runtime.
```
./main [MODE] [WIDTH] [HEIGHT] [FPS] [DURATION (only in render mode)]
```
