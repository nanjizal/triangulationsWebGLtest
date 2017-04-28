package triangulationsWebGLtest.visualTests;
import triangulations.FillShape;
import justTriangles.PathContext;
import triangulationsWebGLtest.helpers.Draw;
import triangulations.Geom2;
class TestEdgeIntersect {
    public static inline 
    function draw( shape: FillShape, draw: Draw ){
        // geom
        var vert = shape.vertices;
        var v0 = vert[0];
        var v1 = vert[1];
        var v2 = vert[2];
        var v3 = vert[3];
        var c = ( Geom2.edgesIntersect( v0, v1, v2, v3 ) == true )? 1: 4;
        // render
        var ctx = new PathContext( 1, 1024, 0, 0 );
        var thick = 4;
        ctx.setThickness( 4 );
        ctx.fill = false;
        ctx.setColor( c );
        draw.edges( shape.edges, shape, ctx, true );
        ctx.render( thick, false );
        return ctx;
    }
}
