package triangulationsWebGLtest.visualTests;
import triangulations.FillShape;
import triangulations.Triangulate;
import triangulations.Delaunay;
import triangulations.Edges;
import triangulations.SideEdge;
import justTriangles.PathContext;
import triangulationsWebGLtest.helpers.Draw;
import triangulations.Geom2;
class TestQuadEdge {
    public static inline 
    function draw( shape: FillShape, draw: Draw, toggle: Bool ){
        // geom
        var vert = shape.vertices;
        var face = shape.faces;
        var edges = shape.edges;
        var coEdges = new Edges();
        var sideEdges = new Array<SideEdge>();
        Triangulate.makeQuadEdge( vert, edges, coEdges, sideEdges );
        // render
        draw.sevenSegOnEdges = true;
        var ctx = new PathContext( 1, 1024, 0, 0 );
        draw.titleTextBlue( 'Quad Edge test', ctx );
        draw.textViolet( 'click on yellow square to flip', ctx, 10, 1000 );
        var thick = 4;
        ctx.setThickness( 4 );
        ctx.fill = true;
        ctx.setColor( 2, 3 );
        ctx.moveTo( 0, 0 );
        if( !toggle )  draw.edges( edges, shape, ctx, true );
        ctx.fill = true;
        ctx.setColor( 7, 2 );
        ctx.moveTo( 0, 0 );
        if( toggle ) {
            edges.flipEdge( coEdges, sideEdges, 12 );
            draw.edges( edges, shape, ctx, true );
        }
        ctx.setColor( 3, 3 );
        ctx.moveTo( 0, 0 );
        // yellow square on edge 12.
        var e = edges[12];
        draw.squareBetween( 2, ctx, vert[e.p], vert[e.q] );
        ctx.render( thick, false );
        draw.sevenSegOnEdges = false;
        return ctx;
    }
}
