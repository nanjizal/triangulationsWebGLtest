package triangulationsWebGLtest;
// library testing
import triangulations.*;
// shapes
import triangulationsWebGLtest.fillShapes.*;
// tests
import triangulationsWebGLtest.visualTests.*;
// justTriangle vector generation
import justTriangles.*;
// webgl and html helpers and additional justTriangle generation code for webgl.
import htmlHelper.tools.CSSEnterFrame;
import justTrianglesWebGL.Drawing;
import justTrianglesWebGL.InteractionSurface;
// maths basic vector functionality used by triangulations, and matrix rotation
import khaMath.Vector2;
import khaMath.Matrix4;
// helpers, for drawing and navigation
import triangulationsWebGLtest.helpers.Draw;
import triangulationsWebGLtest.helpers.Nav;
// js Specifc
import js.Browser;
import js.html.HTMLDocument;
import js.html.DivElement;
import js.html.Event;
import js.html.KeyboardEvent;
import js.html.MouseEvent;

class MainTestSetup {
    static function main(){
        new MainTestSetup();
    }
    var verts: Vertices;
    var ctx: PathContext;
    var interactionSurface:   InteractionSurface<Vector2>;
    var allShapes: AllShapes;
    var draw: Draw;
    var nav: Nav;
    var edgesVertices: EdgesVertices;
    public function new(){
        allShapes = new AllShapes();
        draw = new Draw();
        interactionSurface = new InteractionSurface( 1024, 1024, '0xcccccc' );
        navSetup();
        interactionSurface.bg.addEventListener( 'mousedown', mouseDown );
    }
    public function mouseDown( e: MouseEvent ){
        var p = new Vector2( e.clientX * 2, e.clientY * 2 );
        if( edgesVertices == null ) return;
        var i = edgesVertices.hitTestId( p, 50 );
        if( i == null ) return;
        if( i < 0 ) {
            i = -i - 1; 
            trace( 'edge found ' + i );
            // quadEdge
            if( scene == 6 ) {
                if( i == 12 ) {
                    toggle12 = !toggle12;
                    trace( 'toggle ');
                    draw.render();
                }
            } else if( scene == 9 ){
                splitId = i;
                draw.render();
            }
            
        } else {
            trace( 'vertex found ' + i );
        }
    }
    var splitId: Int = null;
    function navSetup(){
        var startScene = 0;
        var maxScene = 10;
        var mouseScenes = [8];
        nav = new Nav( startScene, maxScene, mouseScenes );
        nav.onSceneChange = sceneSetup;
        nav.setTransform = animateAssign;
        nav.mouseMoveUpdate = draw.render;
        nav.start();
    }
    public function animateAssign( animation: Void -> Matrix4 ) {
        draw.webgl.transformationFunc = animation;
    }
    var scene: Int;
    var currShape: FillShape;
    function sceneSetup( val: Int ){
        scene = val;
        draw.showInstructions = true;
        currShape = switch( scene ){
            case 0:
                trace( 'banana test' );
                allShapes.banana;
            case 1:
                trace( 'edge intersect' );
                allShapes.edgeIntersectShape;
            case 2:
                trace( 'poly in point' );
                allShapes.pointInPolyShape;
            case 3: 
                trace( 'angle compare');
                allShapes.angleCompareShape;
            case 4: 
                trace( 'point in Triangle' );
                allShapes.pointInTriangleShape;
            case 5: 
                trace( 'triangulate test' );
                allShapes.triangulateShape;
            case 6:
                trace( 'quad edge test');
                allShapes.quadEdgeShape;
            case 7: 
                trace( 'delaunay test');
                allShapes.delaunayShape;
            case 8:
                trace('enclosing triangle test');
                allShapes.enclosingTriangleShape;
            case 9:
                trace('split test');
                allShapes.splitShape;
            case 10:
                trace('rupert test - broken');
                allShapes.triangulateShape;
            default:
                trace( 'no test');
                null;
        }
        var vert: Vertices = if( currShape != null ) {
            currShape.vertices;
        } else {
            null;
        }
        if( currShape != null ){
            edgesVertices = EdgesVertices.fromShape( currShape );
        }
       draw.testScene = switch( scene ){
            case 0:
                bananaTest;
            case 1:
                edgeIntersectTest;
            case 2:
                pointInPolyTest;
            case 3: 
                angleCompareTest;
            case 4:
                pointInTriangleTest;
            case 5:
                triangulateTest;
            case 6:
                quadEdgeTest;
            case 7:
                delaunayTest;
            case 8: 
                enclosingTriangleTest;
            case 9: 
                splitTest;
            case 10:
                rupertTest;
            default:
                bananaTest;
        }
        draw.render();
        interactionSurface.setup( vert, transform, draw.render );
    }
    public var testScene: Void -> Void;
    
    function pointInPolyTest(){
        ctx = TestPointInPoly.draw( allShapes.pointInPolyShape, draw );
    }
    // Don't really understand this one but looks like it's working!!
    function angleCompareTest(){
        ctx = TestAngleCompare.draw( allShapes.angleCompareShape, draw );
    }
    function pointInTriangleTest(){
        ctx = TestPointInTriangle.draw( allShapes.pointInTriangleShape, draw );
    }
    var toggle12: Bool = false;
    function edgeIntersectTest(){
        ctx = TestEdgeIntersect.draw( allShapes.edgeIntersectShape, draw );
    }
    function triangulateTest(){
        ctx = TestTriangulate.draw( allShapes.triangulateShape, draw );
    }
    function quadEdgeTest(){
        ctx = TestQuadEdge.draw( allShapes.quadEdgeShape, draw, toggle12 );
    }
    function delaunayTest(){
        ctx = TestDelaunay.draw( allShapes.delaunayShape, draw );
    }
    var all: Edges;
    var vert: Vertices;
    var shape: FillShape;
    var coEdges: Edges;
    var sideEdges: Array<SideEdge>;
    public function enclosingTriangleTest(){
        shape = allShapes.enclosingTriangleShape;
        vert = shape.vertices;//.clone();
        var face = shape.faces;
        var edges = shape.edges;
        ctx = new PathContext( 1, 1024, 0, 0 );
        draw.titleTextBlue( 'Enclosing Triangle test', ctx );
        draw.textViolet( 'rollover to detect', ctx, 850, 200 );
        draw.textViolet( 'which triangle your in', ctx, 900, 280 );
        ctx.lineType = TriangleJoinCurve;
        var thick = 4;
        ctx.setThickness( 4 );
        ctx.setColor( 4, 3 );
        ctx.fill = true; // with polyK
        var diags = Triangulate.triangulateFace( vert, face[0] );
        all = edges.clone().add( diags );
        coEdges = new Edges();
        sideEdges = new Array<SideEdge>();
        Triangulate.makeQuadEdge( vert, all, coEdges, sideEdges );
        ctx.moveTo( 0, 0 );
        //drawVertices( shape, ctx, false );
        draw.faces( shape, ctx, false );
        //drawEdges( edges, shape, ctx, false );
        ctx.setColor( 0 );
        ctx.fill = true; // with polyK 
        ctx.lineType = TriangleJoinCurve; // - default
        draw.verticesPoints( shape, ctx, -1, 1, 5 );
        ctx.render( thick, false );
        encloseTriangleDraw();
    }
    
    // TODO: Refactor to be only called rather than method above when triangle moves.
    public function encloseTriangleDraw(){
        var p = new Vector2( nav.mX, nav.mY );
        //square( 0, ctx, p );
        var ctx2 = new PathContext( 1, 1024, 0, 0 );
        var thick = 4;
        ctx2.setThickness( 4 );
        var findTri = new FindEnclosingTriangle();
        var triangle = findTri.getFace( vert, all, coEdges, sideEdges, p, 0 );
        ctx2.setColor( 7, 7 );
        ctx2.fill = true; // with polyK 
        if( triangle != null ) draw.face( triangle, shape, ctx2, false );
        ctx2.render( thick, false );
    }
    
    public function rupertTest(){

        //shape = allShapes.triangulateShape;//keyShape;
        shape = allShapes.delaunayShape;
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
        /*
        var verticesBackup = vertices.clone();
        var edgesBackup = edges.clone();
        var coEdgesBackup = coEdges.clone();
        var sideEdgesBackup = [];
        var l = edges.length;
        for ( j in 0... l ) sideEdgesBackup[j] = sideEdges[j].clone();
        */
          
        var setting = new Settings();
        //setting.maxSteinerPoints = 50;
        //setting.minAngle = 20;
        Rupert.refineTo( vert, all, coEdges, sideEdges, setting );
        // trace( 'edges ' + edges );
        ctx = new PathContext( 1, 1024, 0, 0 );
        draw.titleTextBlue( 'Rupert test (not working yet)', ctx );
        ctx.lineType = TriangleJoinCurve;
        var thick = 4;
        ctx.setThickness( 4 );
        ctx.setColor( 4, 3 );
        ctx.fill = true; // with polyK
        ctx.moveTo( 0, 0 );
        draw.edges( all, shape, ctx, true );
        //ctx.setColor( 0, 3 );
        //draw.faces( shape, ctx, false );
        ctx.render( thick, false );
        
    }
    
    public function splitTest(){
        ctx = TestSplit.draw( allShapes.splitShape, draw, edgesVertices, splitId );
    }
    
    public inline function transform( x: Float, y: Float ): Point {
       return ctx.pt( x, y );
    }
    
    public function bananaTest(){
        ctx = TestShape.draw( allShapes.banana, draw );
        draw.titleTextBlue( 'Banana test - WebGL working', ctx );
        draw.textViolet('drag points',ctx, 700, 400 );
        draw.textViolet( '<- use arrow keys for next test ->', ctx, 10, 950 );
    }
}
