package triangulationsWebGLtest.fillShapes;
import triangulationsWebGLtest.*;
import triangulations.FillShape;

class AllShapes{
    public var banana:               FillShape;
    public var guitar:               FillShape;
    public var keyShape:             FillShape;
    public var sheet:                FillShape;
    public var ty:                   FillShape;
    public var angleCompareShape:    FillShape;
    public var delaunayShape:        FillShape;
    public var edgeIntersectShape:   FillShape;
    public var enclosingTriangleShape:    FillShape;
    public var graphShape:           FillShape;
    public var pointInPolyShape:     FillShape;
    public var pointInTriangleShape: FillShape;
    public var quadEdgeShape:        FillShape;
    public var splitShape:           FillShape;
    public var triangulateShape:     FillShape;
    public function new(){
        banana  = new Banana();
        guitar  = new Guitar();
        keyShape = new Key();
        sheet   = new Sheet();
        ty      = new Ty();
        angleCompareShape       = new TestAngleCompareShape();
        delaunayShape           = new TestDelaunayShape();
        edgeIntersectShape      = new TestEdgeIntersectShape();
        enclosingTriangleShape  = new TestEnclosingTriangleShape();
        graphShape              = new TestGraphShape();
        pointInPolyShape        = new TestPointInPolyShape();
        pointInTriangleShape    = new TestPointInTriangleShape();
        quadEdgeShape           = new TestQuadEdgeShape();
        splitShape              = new TestSplitShape();
        triangulateShape        = new TestTriangulateShape();
        var dataShapes = [  banana
                        ,   guitar
                        ,   keyShape
                        ,   sheet
                        ,   ty
                        ,   angleCompareShape
                        ,   delaunayShape 
                        ,   edgeIntersectShape  
                        ,   enclosingTriangleShape  
                        ,   graphShape  
                        ,   pointInPolyShape 
                        ,   pointInTriangleShape 
                        ,   quadEdgeShape 
                        ,   splitShape 
                        ,   triangulateShape ];
        var l = dataShapes.length;
        var shape: FillShape;
        for( i in 0...l ) {
            shape = dataShapes[i];
            shape.fit( 1024, 1024, 120 );
            // set the outline!
            shape.set_fixedExternal( true );
        }
    }
}
