package gl3d.post 
{
	import gl3d.Material;
	import gl3d.meshs.Meshs;
	import gl3d.Node3D;
	import gl3d.shaders.GLShader;
	import gl3d.shaders.posts.PostGLShader;
	import gl3d.TextureSet;
	import gl3d.util.Utils;
	import gl3d.View3D;
	/**
	 * ...
	 * @author lizhi
	 */
	public class PostEffect 
	{
		private static var node:Node3D;
		private var _material:Material;
		public var shader:GLShader;
		public function PostEffect(shader:GLShader=null) 
		{
			this.shader = shader || new PostGLShader;
			if (node==null) {
				node = new Node3D;
				var hw:Number = 1;
				var hh:Number = 1;
				var hd:Number = 0;
				node.drawable=Meshs.createDrawable(
					Vector.<uint>([
						0, 1, 2, 0, 2, 3
						]),
					Vector.<Number>([
						hw, hh, hd, hw, -hh, hd, -hw, -hh, hd, -hw, hh, hd
					]),
					Vector.<Number>([
						1, 0, 1, 1, 0, 1, 0, 0
					]),
					Vector.<Number>([
						0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1
					])
				);
			}
		}
		
		public function get material():Material {
			if (_material==null) {
				_material = new Material();
				_material.shader = shader; 
			}
			return _material;
		}
		
		public function update(view3D:View3D,isEnd:Boolean):void 
		{
			
			material.textureSets = Vector.<TextureSet>([view3D.postRTTs[0]]);
			node.material = material;
			if (isEnd) {
				view3D.context.setRenderToBackBuffer();
			}else {
				view3D.context.setRenderToTexture(view3D.postRTTs[1].texture);
			}
			view3D.context.clear();
			node.update(view3D);
			
		}
		
	}

}