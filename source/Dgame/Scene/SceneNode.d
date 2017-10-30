module Dgame.Scene.SceneNode;

private:

import std.algorithm.mutation : remove;
import std.algorithm.searching : canFind;

import Dgame.Graphic.Transformable;
import Dgame.Scene.DrawableNode;

public:

/**
 * Represent a scene node of a scene graph
 *
 * Author: Elias Batek
 */
class SceneNode : Transformable, DrawableNode {
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
    void attachChild(SceneNode child) in {
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
     * Draws all child nodes
     */
    @nogc
    void drawChildren(ref const Window wnd) nothrow {
        foreach(DrawableNode child; _children) {
            child.draw(wnd);
        }
    }

    /**
     * See_Also: .addChild(Node);
     */
    void opOpAssign(string op : "~")(Node child) {
        addChild(child);
    }

    /**
     * Returns the parent node or null if there is none
     */
    @nogc
    @property
    SceneNode parent() pure nothrow {
        return _parent;
    }
}