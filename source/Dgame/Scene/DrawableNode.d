module Dgame.Scene.DrawableNode;

private:

import Dgame.Graphic.Drawable;

public:

import Dgame.Window.Window;

/**
 * DrawableNode is the interface for nodes which can be drawn.
 *
 * Author: Elias Batek
 */
interface DrawableNode : Drawable {
    /**
     * Draws the node itself only
     */
    @nogc
    void drawCurrent(ref const Window) nothrow;

    /**
     * Draws the node's children
     */
    @nogc
    void drawChildren(ref const Window) nothrow;
}