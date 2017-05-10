package triangulationsWebGLtest.visualTests;
import triangulations.FillShape;
import triangulations.Triangulate;
import triangulations.Delaunay;
import triangulations.Ruppert;
import triangulations.Settings;
import triangulations.Edges;
import triangulations.SideEdge;
import justTriangles.PathContext;
import triangulationsWebGLtest.helpers.Draw;
import triangulations.Geom2;
import khaMath.Vector2;
class TestRuppert {
    public static inline 
    function draw( shape: FillShape, draw: Draw ){
        var vert = shape.vertices;
        var face = shape.faces;
        var edges = shape.edges;
        //var diags = Triangulate.triangulateSimple( vert, edges, [face[0]] );
        var diags = Triangulate.triangulateFace( vert, face[0] );
        var all = edges.clone().add( diags );
        var coEdges = new Edges();
        var sideEdges = new Array<SideEdge>();
        Triangulate.makeQuadEdge( vert, all, coEdges, sideEdges );
        var delaunay = new Delaunay();
        delaunay.refineToDelaunay( vert, all, coEdges, sideEdges );
        var setting = new Settings();
        setting.maxSteinerPoints = 50;
        setting.minAngle = 20;
        Ruppert.refineTo( vert, all, coEdges, sideEdges, setting );
        var ctx = new PathContext( 1, 1024, 0, 0 );
        draw.titleTextBlue( 'Ruppert test', ctx );
        ctx.lineType = TriangleJoinCurve;
        var thick = 4;
        ctx.setThickness( 4 );
        ctx.setColor( 4, 3 );
        ctx.fill = true; // with polyK
        ctx.moveTo( 0, 0 );
        draw.edges( all, shape, ctx, true );
        ctx.setColor( 0, 3 );
        draw.faces( shape, ctx, false );
        ctx.render( thick, false );
        return ctx;
    }
}
