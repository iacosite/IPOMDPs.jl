module IPOMDPs

export
    # Abstract types
    IPOMDP,
    Agent,
    Model,
    IntentionalModel,
    SubintentionalModel,

    # Standard defined models
    ipomdpModel,
    pomdpModel,
    sModel,

    # Functions
    states,
    agents,
    frames,
    actions,
    observations,
    transition,
    rewards,

    # Initial distributions
    initial_state_distribution,
    initial_model_distribution

    include("ipomdps.jl")
end
