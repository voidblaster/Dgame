/*
 *******************************************************************************************
 * Dgame (a D game framework) - Copyright (c) Randy Schütt
 * 
 * This software is provided 'as-is', without any express or implied warranty.
 * In no event will the authors be held liable for any damages arising from
 * the use of this software.
 * 
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 * 
 * 1. The origin of this software must not be misrepresented; you must not claim
 *    that you wrote the original software. If you use this software in a product,
 *    an acknowledgment in the product documentation would be appreciated but is
 *    not required.
 * 
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.
 * 
 * 3. This notice may not be removed or altered from any source distribution.
 *******************************************************************************************
 */
 module Dgame.Graphic.Scene.SceneNode;

private:

import std.algorithm.mutation : remove;
import std.algorithm.searching : canFind;

import Dgame.Graphic.Scene.DrawableNode;
import Dgame.Graphic.Transformable;

public:

/**
 * Represent a scene node of a scene graph
 *
 * Author: Elias Batek (0xEAB)
 */
class SceneNode : Transformable, DrawableNode!(SceneNode) {
private:
    SceneNode _parent = null;
    SceneNode[] _children;

public:

    /**
     * Draws the node itself only
     */
    @nogc
    void drawCurrent(ref const Window wnd) nothrow {
        // Does nothing by default
    }

final:
    /**
     * Attachs a child node
     */
    void attachChild(SceneNode child) nothrow pure in {
        assert((child._parent is null), "The passed node has already got a parent.");
        assert(!_children.canFind(child), "The passed node has already been attached.");
    } body {
        _children ~= child;
        child._parent = this;
    }

    /**
     * Detaches a child node
     */
    void detachChild(SceneNode child) in {
        assert((child._parent == this), "The passed node is not a child of this node.");
        assert(_children.canFind(child), "The passed node has not been attached.");
    } body {
        // TODO: as a child can only occur once,
        // maybe removing it by passing its index might be faster
        _children = _children.remove!(n => n == child)();
    }

    /**
     * Draws the node and all its child nodes
     */
    @nogc
    void draw(ref const Window wnd) nothrow {
        
        drawCurrent(wnd);
        drawChildren(wnd);
    }

    /**
     * Draws this node's children only
     */
    @nogc
    void drawChildren(ref const Window wnd) nothrow {
        foreach(DrawableNode!(SceneNode) child; _children) {
            child.draw(wnd);
        }
    }

    /**
     * See_Also: .addChild(SceneNode);
     */
    void opOpAssign(string op : "~")(SceneNode child) {
        addChild(child);
    }

    /**
     * Returns: the parent node or null if there is none
     */
    @nogc
    @property
    @safe
    SceneNode parent() pure nothrow {
        return _parent;
    }
}