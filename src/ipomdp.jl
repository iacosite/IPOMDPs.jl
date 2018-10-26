# NOTE: sp = State Produced = resulting state
#	s = starting state
#=
 = Type Hierarchy
 =#
abstract type IPOMDP{S,A,W} end
abstract type Model{A,W} end
abstract type Agent{S,A,W} end

struct IS{S}
    state::S
    models::Vector{Model}
end

#
#   Problem structure definitions
#

# Problem
"""
    Te cartesian product among the actions of the agents emulated by the IPOMDP
    actions_problem(problem::IPOMDP)
Return
    Dict{Agent, Any}
"""
function actions_problem end

# Agent

"""
    The agent the specified frame refers to
    agent(frame::X)
    X <: Any
Return:
    Agent{S,A,W}
"""
function agent end


"""
    All the possible actions an agent can do. This must be a superset of all the actions all the models of an agent can perform
    actions_agent(agent::Agent{S,A,W})
Return:
    Vector{A}
"""
function actions_agent end

"""
    All the possible observations an agent can receive. This must be a superset of all the observations all the models of an agent can receive
    observations_agent(agent::Agent{S,A,W})
Return:
    Vector{W}
"""
function observations_agent end
"""
    All the frames an agent can have.
    emulated_frames(frame::IPOMDP)
Return:
    Vector{Any}
"""
function emulated_frames end

# Model
"""
    Describes the way the frame Y receives observations from the environment as specified by the emulating frame X
    model_observation(frame::IPOMDP, frame::Y, s::S, a::Dict{Agent, Any}, o::W)
    Y <: Any
Return:
    SparseCat{W, Float64}
"""
function model_observation end

"""
    Creates the model starting from a defined frame
    Model(frame::X)
    X <: Any
Return:
    Model{A,W}
"""
function Model end

"""
    Updates the history of the model and returns the new model
    tau(model::M, action::A, observation::W) 
    M <: Model{A,W}
Return:
    Model{A,W}
"""
function tau end

"""
    Describes the next optimal action
    action(model::M)
    M <: Model{A,W}
Return:
    A
"""
function action end

"""
    The probability that a model takes a specific action
    actionP(model::Model{A,W},  a::A)
Return:
    Float64
"""
function actionP(model::Model{A,W}, a::A) where {A,W}
    # Run 100 trials and calculate probability
    N = 100
    n_a = 0
    for i = 1:N
	    if action(model) == a
	        n_a = n_a +1
	    end
    end

    return n_a/N
end

# IPOMDP definition
"""
    states(ipomdp::IPOMDP{S})
Return: 
    Vector{S}
"""
function states end

"""
    observation(ipomdp::IPOMDP{S}, state::S, actions::Dict{Agent, Any})
Return:
    SparseCat{W, Float64}
"""
function observation end

"""
    transition(ipomdp::IPOMDP{S}, state::S, actions::Dict{Agent, Any})
Return:
    SparseCat{S, Float64}
"""
function transition end

"""
    reward(ipomdp::IPOMDP{S}, is::IS, actions::Dict{Agent, Any})
Return:
    Float64
"""
function reward end

"""
    discount(ipomdp::IPOMDP{S})
Return:
    Float64
"""
function discount end


# Belief related
"""
    The initial belief distribution over the physical states in the world
Return:
    SparseCat{S, Float64}
"""
function initialstate_distribution end

"""
    The initial belief distribution over the frames emulated by the IPOMDP agent
Return:
    SparseCat{Any, Float64}
"""
function initialframe_distribution end


