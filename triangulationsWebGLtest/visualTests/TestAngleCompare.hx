package triangulationsWebGLtest.visualTests;
import triangulations.FillShape;
import justTriangles.PathContext;
import triangulationsWebGLtest.helpers.Draw;
import triangulations.Geom2;
class TestAngleCompare {
    public static inline 
    function draw( shape: FillShape, draw: Draw ){
        // geom
        var vert = shape.vertices;
        var v0 = vert[0];
        var v1 = vert[1];
        var v2 = vert[2];
        var v3 = vert[3];
        var cmp = Geom2.angleCompare( v0, v1 );
        var r = cmp( v2, v3 );
        // render
        var thick = 4;
        var ctx = new PathContext( 1, 1024, 0, 0 );
        draw.titleTextBlue( 'Angle Compare test', ctx );
        draw.textViolet( 'drag points around', ctx, 50, 950 );
        draw.textViolet( 'not really sure what this does!', ctx, 50, 1020 );
        ctx.setThickness( 4 );
        ctx.setColor( 0, 3 );
        ctx.fill = true; // with polyK
        draw.edges( shape.edges, shape, ctx, true );
        draw.verticesPoints( shape, ctx, 0, 0, 5 );
        var c2 = r < 0 ? 1 : 0;
        var c3 = r > 0 ? 1 : 0;
        ctx.setColor( c2, c2  );
        draw.square( 0, ctx, v2 );
        ctx.setColor( c3, c3  );
        draw.square( 0, ctx, v3 );
        ctx.render( thick, false );
        return ctx;
    }
}
