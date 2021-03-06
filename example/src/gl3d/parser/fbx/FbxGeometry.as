package gl3d.parser.fbx{
	import flash.geom.Vector3D;
	import gl3d.core.Drawable;

	public class FbxGeometry {

		private var root : Object;
		public var vertices:Array;
		private var polygons:Array;
		public var drawables:Array;
		public var nodes:Array = [];
		public var uv:Array;
		public var objs:Array = [];
		public function FbxGeometry( root:Object,vertices:Array=null,polygons:Array=null) {
			this.root = root;
			this.polygons=polygons = polygons||FbxTools.getInts(FbxTools.get(root, "PolygonVertexIndex"));
			this.vertices = vertices = vertices || FbxTools.getFloats(FbxTools.get(root, "Vertices"));
			if(root){
				for each(var v:Object in FbxTools.getAll(root,"LayerElementUV") ) {
					var uvi:Array = FbxTools.getInts(FbxTools.get(v,"UVIndex", true));
					uv = FbxTools.getFloats(FbxTools.get(v, "UV"));
					for (var k:int = 0; k < uv.length; k += 2 ) {
						uv[k+1] = 1 - uv[k+1];
					}
					break;
				}
				
				var matOs:Object = FbxTools.get(root, "LayerElementMaterial", true);
				if (matOs!=null) {
					var mats:Array = FbxTools.getInts(FbxTools.get(matOs, "Materials"));
				}
			}
			var prev:int = 0;
			var p:Array = polygons;
			
			var indexA:Array;
			var uvindex:Array;
			var tcounter:int = 0;
			for (var i:int = 0; i < p.length;i++ ){
				var index:int = p[i];
				if (index < 0){
					var start:int = prev;
					var total:int = i - prev + 1;
					if (mats&&tcounter<mats.length) {
						var mid:int = mats[tcounter];
					}else {
						mid = 0;
					}
					var obj:Array = objs[mid];
					if (obj==null) {
						obj = objs[mid] = [[]];
						if (uvi) {
							obj[1] = [];
						}
					}
					indexA = obj[0];
					uvindex = obj[1];
					tcounter += total - 2;
					prev = i + 1;
					p[i] ^= -1;
					var f:Array = [];
					indexA.push(f);
					if(uvi){
						var uvf:Array = [];
						uvindex.push(uvf);
					}
					for (var j:int = 0; j < total;j++ ) {
						f.push(p[start + j]);
						if(uvi){
							uvf.push(uvi[start + j]);
						}
					}
				}
			}
		}

		/*public function getColors():Object {
			var color:Array = FbxTools.get(root,"LayerElementColor",true);
			return color == null ? null : { values : FbxTools.getFloats(FbxTools.get(color,"Colors")), index : FbxTools.getInts(FbxTools.get(color,"ColorIndex")) };
		}*/
	}
}