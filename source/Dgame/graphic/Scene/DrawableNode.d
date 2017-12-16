module Dgame.Scene.DrawableNode;

private:

import Dgame.Graphic.Drawable;
import Dgame.Scene.Node;

public:

import Dgame.Window.Window;

/**
 * DrawableNode is the interface for nodes which can be drawn.
 *
 * Author: Elias Batek (0xEAB)
 */
interface DrawableNode(NodeType) : Drawable, Node!(NodeType) {
    /**
     * Draws the node itself only
     */
    @nogc
    void drawCurrent(ref const Window) nothrow;

    /**
     * Draws this node's children only
     */
    @nogc
    void drawChildren(ref const Window) nothrow;
}