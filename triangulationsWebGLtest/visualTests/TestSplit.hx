package triangulationsWebGLtest.visualTests;
import triangulations.FillShape;
import triangulations.Triangulate;
import triangulations.Delaunay;
import triangulations.Edges;
import triangulations.SideEdge;
import justTriangles.PathContext;
import triangulationsWebGLtest.helpers.Draw;
import triangulations.Geom2;
import triangulations.EdgesVertices;
class TestSplit {
    public static inline 
    function draw( shape: FillShape, draw: Draw, edgesVertices: EdgesVertices, splitId: Int ){
        // geom
        var shape = shape.clone();
        var vert = shape.vertices;
        var face = shape.faces;
        var edges = shape.edges;
        var diags = Triangulate.triangulateFace( vert, face[0] );
        var all = edges.clone().add( diags );
        var coEdges = new Edges();
        var sideEdges = new Array<SideEdge>();
        Triangulate.makeQuadEdge( vert, all, coEdges, sideEdges );
        var delaunay = new Delaunay();
        delaunay.refineToDelaunay( vert, all, coEdges, sideEdges );
        var extra = all.clone();
        if( splitId != null ) Triangulate.splitEdge( vert, extra, coEdges, sideEdges, splitId );
        edgesVertices.edges = extra;
        edgesVertices.vertices = vert;
        // render
        draw.sevenSegOnEdges = true;
        draw.sevenSegOnPoints = false;
        var ctx = new PathContext( 1, 1024, 0, 0 );
        draw.titleTextBlue( 'Split test', ctx );
        draw.textViolet( 'click on edge number to split', ctx, 10, 1000 );
        var thick = 4;
        ctx.setThickness( 4 );
        ctx.setColor( 4, 0 );
        ctx.moveTo( 0, 0 );
        ctx.fill = false;
        ctx.setColor( 0, 3 );
        ctx.moveTo( 0, 0 );
        //faces( shape, ctx );
        draw.edges( all, shape, ctx, true );
        draw.edges( extra, shape, ctx, true );
        ctx.setColor( 1, 3 );
        ctx.moveTo( 0, 0 );
        draw.edges( edges, shape, ctx, true );
        ctx.render( thick, false );
        draw.sevenSegOnEdges = false;
        draw.sevenSegOnPoints = true;
        return ctx;
    }
}
