# NOTE: sp = State Produced = resulting state
#	s = starting state
#=
 = Type Hierarchy
 =#
abstract type IPOMDP{S} end

abstract type Agent{S,A,W} <: IPOMDP{S} end

abstract type Model{S,A,W} <: Agent{S,A,W} end

abstract type IntentionalModel{S,A,W} <: Model{S,A,W} end
abstract type SubintentionalModel{S,A,W} <: Model{S,A,W} end

abstract type ipomdpModel{S,A,W} <: IntentionalModel{S,A,W} end
abstract type pomdpModel{S,A,W} <: IntentionalModel{S,A,W} end
abstract type sModel{S,A,W} <: SubintentionalModel{S,A,W} end

#=
 =Framework functions
 =#
"""
    discount(ipomdp::IPOMDP{S})
"""
function discount end

"""
    states{S}(ipomdp::IPOMDP{S})
"""
function states end

"""
    n_states(problem::IPOMDP{S})
"""
# Automatically defined
function n_states(problem::IPOMDP)
    return size(states(problem), 1)
end

"""
    state_index(problem::IPOMDP{S}, s::S)
"""
function state_index(ipomdp::IPOMDP, s::Any)
    return find(IPOMDPs.states(ipomdp), s)
end

"""
    agents(ipomdp::IPOMDP{S})
    agents(ipomdp::IPOMDP{S}, model::ipomdpModel{S,A,W})
"""
function agents end

"""
    n_agents(problem::IPOMDP{S})
    n_agents(problem::IPOMDP{S}, model::ipomdpModel{S,A,W})
"""
# Automatically defined
function n_agents(problem::IPOMDP)
    return size(agents(problem), 1)
end
# Automatically defined
function n_agents(problem::IPOMDP, model::ipomdpModel)
    return size(agents(problem, model), 1)
end

"""
    agent_index(problem::IPOMDP{S}, agent::Agent{S,A,W})
    agent_index(problem::IPOMDP{S}, model::ipomdpModel{S,A,W}, agent::Agent{S,A,W})
"""
function agent_index(ipomdp::IPOMDP, agent::Agent)
    return find(IPOMDPs.agents(ipomdp), agent)
end
function agent_index(ipomdp::IPOMDP, model::ipomdpModel, agent::Agent)
    return find(IPOMDPs.states(ipomdp, model), s)
end

"""
    actions(ipomdp::IPOMDP{S}, agent::Agent{S,A,W})
"""
function actions end

"""
    n_actions(problem::IPOMDP{S}, agent::Agent{S,A,W})
"""
# Automatically defined
function n_actions(problem::IPOMDP, agent::Agent)
    return size(actions(problem, agent), 1)
end

"""
    action_index(problem::IPOMDP{S}, agent::Agent{S,A,W}, a::A)
"""
function action_index(ipomdp::IPOMDP, agent::Agent, a::Any)
    return find(IPOMDPs.actions(ipomdp, agent), a)
end

"""
    observations(ipomdp::IPOMDP{S}, agent::Agent{S,A,W})
"""
function observations end

"""
    n_observations(problem::IPOMDP{S}, agent::Agent{S,A,W})
"""
# Automatically defined
function n_observations(problem::IPOMDP, agent::Agent)
    return size(observations(problem, agent), 1)
end

"""
    observation_index(problem::IPOMDP{S}, agent::Agent{S,A,W}, o::W)
"""
function observation_index(ipomdp::IPOMDP, agent::Agent, o::Any)
    return find(IPOMDPs.observations(ipomdp, agent), o)
end

"""
    models(ipomdp::IPOMDP{S}, agent::Agent{S,A,W})
"""
function models end

"""
    n_models(problem::IPOMDP{S}, agent::Agent{S,A,W})
"""
# Automatically defined
function n_models(problem::IPOMDP, agent::Agent)
    return size(models(problem, agent), 1)
end

"""
    model_index(ipomdp::IPOMDP{S}, agent::Agent{S,A,W}, model::Model{S,A,W})
"""
function model_index(ipomdp::IPOMDP, agent::Agent, m::Model)
    return find(IPOMDPs.models(ipomdp, agent), m)
end

# Ti
"""
    transition(ipomdp::IPOMDP{S}, model::ipomdpModel{S,A,W}, s::S, a::Vector{A})
    transition(ipomdp::IPOMDP{S}, model::pomdpModel{S,A,W}, s::S, a::Vector{A})
"""
function transition end

# Oi
"""
    observation(ipomdp::IPOMDP{S}, model::ipomdpModel{S,A,W}, a::Vector{A}, sp::S, a::Vector{A})
    observation(ipomdp::IPOMDP{S}, model::pomdpModel{S,A,W}, a::Vector{A}, sp::S) (non implemented)
			or
    observation(ipomdp::IPOMDP{S}, model::pomdpModel{S,A,W}, a::A, sp::S) (currently implemented)
"""
function observation end

# Ri
"""
    reward(ipomdp::IPOMDP{S}, model::ipomdpModel{S,A,W}, s::S, a::Vector{A})
    reward(ipomdp::IPOMDP{S}, model::pomdpModel{S,A,W}, s::S, a::Vector{A}) (not implemented)
			or

    reward(ipomdp::IPOMDP{S}, model::pomdpModel{S,A,W}, s::S, a::A) (currently implemented)
"""
function reward end

"""
    initial_state_distribution(ipomdp::IPOMDP{S}, model::ipomdpModel{S,A,W})
    initial_state_distribution(ipomdp::IPOMDP{S}, model::pomdpModel{S,A,W})
"""
function initial_state_distribution end

"""
Specifies the initial likleyhood of each model for the given agent
    initial_model_distribution(ipomdp::IPOMDP{S}, agent::Agent{S,A,W})
"""
function initial_model_distribution end

"""
Specifies wether the reached state is terminal
	isterminal(ipomdp::IPOMDP{S}, s::S)
"""
function isterminal end


