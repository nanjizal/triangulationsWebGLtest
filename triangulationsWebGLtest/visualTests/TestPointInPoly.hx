package triangulationsWebGLtest.visualTests;
import triangulations.FillShape;
import justTriangles.PathContext;
import triangulationsWebGLtest.helpers.Draw;
import triangulations.Geom2;
class TestPointInPoly {
    public static inline 
    function draw( shape: FillShape, draw: Draw ){
        // geom
        var verts = shape.vertices;
        var c = ( verts.pointInPolygon( shape.faces[0][0], verts[0] ) )? 4: 1;
        // render
        var thick = 4;
        var ctx = new PathContext( 1, 1024, 0, 0 );
        draw.titleTextBlue( 'Point in Polygon test', ctx );
        draw.textViolet( "move '0' point inside shape", ctx, 50, 900 );
        ctx.setThickness( 4 );
        ctx.setColor( 0, 3 );
        ctx.fill = true; // with polyK
        ctx.lineType = TriangleJoinCurve;
        draw.faces( shape, ctx, false );
        ctx.fill = true; // with polyK 
        ctx.lineType = TriangleJoinCurve; // - default
        ctx.setColor( c, c  );
        draw.square( 0, ctx, verts[0] );
        draw.verticesPoints( shape, ctx, 0, c, 5 );
        ctx.render( thick, false );
        return ctx;
    }
}
