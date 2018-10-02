module IPOMDPs

using POMDPs
using SARSOP
using BeliefUpdaters
using POMDPModelTools

export
    # Abstract types
    IPOMDP,
    Agent,
    Frame,
    IntentionalFrame,
    SubintentionalFrame,
    IS,

    # Standard defined models
    ipomdpFrame,
    pomdpFrame,
    sFrame,
    frameData,
    frameModel,
    initial_belief,
    action,
    update,

    # Functions
    states,
    stateindex,
    n_states,
    actions,
    actionindex,
    n_actions,
    observations,
    observationindex,
    n_observations,
    agents,
    agentindex,
    n_agents,
    frames,
    frameindex,
    n_frames,
    transition,
    observation,
    reward,

    # Initial distributions
    initialstate_distribution,
    initialframe_distribution

    include("ipomdp.jl")
    include("pomdpFrame.jl")
    include("sFrame.jl")
end
