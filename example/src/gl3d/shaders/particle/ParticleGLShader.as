package gl3d.shaders.particle {
	import flash.display3D.Context3D;
	import flash.display3D.Context3DProgramType;
	import flash.geom.Vector3D;
	import as3Shader.AS3Shader;
	import gl3d.core.Camera3D;
	import gl3d.core.Drawable;
	import gl3d.core.renders.GL;
	import gl3d.core.Material;
	import gl3d.meshs.Meshs;
	import gl3d.core.Node3D;
	import gl3d.core.shaders.GLAS3Shader;
	import gl3d.core.shaders.GLShader;
	import gl3d.shaders.PhongFragmentShader;
	import gl3d.core.View3D;
	/**
	 * ...
	 * @author lizhi
	 */
	public class ParticleGLShader extends GLShader
	{
		
		public function ParticleGLShader() 
		{
			
		}
		
		override public function getVertexShader(material:Material):GLAS3Shader {
			return new ParticleVertexShader(material);
		}
		
		override public function getFragmentShader(material:Material):GLAS3Shader {
			return new ParticleFragmentShader(material,vs as ParticleVertexShader);
		}
		
		/*override public function update(material:Material):void 
		{
			super.update(material);
			var context:GL = material.view.gl3d;
			if (programSet) {
				var view:View3D = material.view;
				var camera:Camera3D = material.camera;
				var node:Node3D = material.node;
				var alpha:Number = material.alpha;
				var color:Vector.<Number> = material.color;
				var pvs:ParticleVertexShader = vs as ParticleVertexShader;
				
				if (pvs.model.used) {
					context.setProgramConstantsFromMatrix(Context3DProgramType.VERTEX, pvs.model.index, node.world, true);
				}
				if (pvs.view.used) {
					context.setProgramConstantsFromMatrix(Context3DProgramType.VERTEX, pvs.view.index, camera.view, true);
				}
				if (pvs.perspective.used) {
					context.setProgramConstantsFromMatrix(Context3DProgramType.VERTEX, pvs.perspective.index, camera.perspective, true);
				}
				if (pvs.time.used) {
					context.setProgramConstantsFromVector(Context3DProgramType.VERTEX, pvs.time.index, Vector.<Number>([view.time,0,0,0]));
				}
				color[3] = alpha;
				context.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT, 0, color);//color
				context.setProgramConstantsFromVector(Context3DProgramType.VERTEX, vs.constMemLen, vs.constPoolVec);
				context.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT, fs.constMemLen, fs.constPoolVec);
				context.drawTriangles(node.drawable.index.buff);
			}
		}*/
	}

}