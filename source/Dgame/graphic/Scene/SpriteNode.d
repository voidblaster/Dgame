module Dgame.Scene.SpriteNode;

private:

import Dgame.Graphic.Sprite;
import Dgame.Scene.SceneNode;
import Dgame.Window.Window;

public:

/**
 * SpriteNode is a scene node storing a sprite.
 *
 * Author: Elias Batek (0xEAB)
 */
class SpriteNode : SceneNode {
private:
    Sprite _sprite;

public:

    /**
     * Draws the node itself only
     */
    @nogc
    override void drawCurrent(ref const Window wnd) nothrow {
        //this._sprite.draw(wnd);
    }

final:

    /**
     * Returns: the stored sprite
     */
    @nogc
    @property
    @safe
    Sprite sprite() pure nothrow {
        return this._sprite;
    }

    /**
     * Replaces the stored sprite
     */
    @nogc
    @property
    @safe
    void sprite(Sprite sprite) pure nothrow {
        this._sprite = sprite;
    }

}