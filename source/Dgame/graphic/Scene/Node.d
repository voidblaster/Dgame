module Dgame.Scene.Node;

public:

/**
 * Represent a node of a graph
 *
 * Author: Elias Batek (0xEAB)
 */
interface Node(NodeType) {
    /**
     * Attachs a child node
     *
     * The passed node must be an orphan.
     */
    void attachChild(NodeType child);

    /**
     * Detaches a child node
     */
    void detachChild(NodeType child);

    /**
     * See_Also: .addChild(NodeType);
     */
    void opOpAssign(string op : "~")(NodeType child);

    /**
     * Returns: the parent node or null if this node is an orphan
     */
    @nogc
    @property
    @safe
    NodeType parent() pure nothrow;
}