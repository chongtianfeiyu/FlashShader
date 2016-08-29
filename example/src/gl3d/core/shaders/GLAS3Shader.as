package gl3d.core.shaders 
{
	import as3Shader.AS3Shader;
	import as3Shader.Creator;
	import as3Shader.Var;
	import flash.display3D.Context3DProgramType;
	import gl3d.core.Material;
	/**
	 * ...
	 * @author lizhi
	 */
	public class GLAS3Shader extends AS3Shader
	{
		public var namedVars:Object = { };
		private var binds:Vector.<Function> = new Vector.<Function>;
		public function GLAS3Shader(programType:String=Context3DProgramType.VERTEX,creator:Creator=null) 
		{
			super(programType, creator);
		}
		
		public function bind(shader:GLShader,material:Material,isLastSameMaterial:Boolean):void {
			for each(var binder:Function in binds) {
				binder(shader,material,isLastSameMaterial);
			}
		}
		//uniform
		public function uniformModel():Var {
			var name:String = "umodel";
			if (getNamedVar(name)) return getNamedVar(name);
			var u:Var = matrix();
			setNamedVar(name, u);
			var binder:GLBinder = new GLBinder(this, u);
			binds.push(binder.bindModelUniform);
			return u;
		}
		public function uniformView():Var {
			var name:String = "uview";
			if (getNamedVar(name)) return getNamedVar(name);
			var u:Var = matrix();
			setNamedVar(name, u);
			var binder:GLBinder = new GLBinder(this, u);
			binds.push(binder.bindViewUniform);
			return u;
		}
		public function uniformPerspective():Var {
			var name:String = "uperspective";
			if (getNamedVar(name)) return getNamedVar(name);
			var u:Var = matrix();
			setNamedVar(name, u);
			var binder:GLBinder = new GLBinder(this, u);
			binds.push(binder.bindPerspectiveUniform);
			return u;
		}
		public function uniformWorld2Local():Var {
			var name:String = "uworld2local";
			if (getNamedVar(name)) return getNamedVar(name);
			var u:Var = matrix();
			setNamedVar(name, u);
			var binder:GLBinder = new GLBinder(this, u);
			binds.push(binder.bindWorld2localUniform);
			return u;
		}
		
		public function uniformLightPos(index:int):Var {
			var name:String = "ulightpos"+index;
			if (getNamedVar(name)) return getNamedVar(name);
			var u:Var = uniform();
			setNamedVar(name, u);
			var binder:GLBinder = new GLBinder(this, u,index);
			binds.push(binder.bindLightPosUniform);
			return u;
		}
		
		public function uniformLightShadowCameraWorld(index:int):Var {
			var name:String = "ulightCameraWorld"+index;
			if (getNamedVar(name)) return getNamedVar(name);
			var u:Var = uniform();
			setNamedVar(name, u);
			var binder:GLBinder = new GLBinder(this, u,index);
			binds.push(binder.bindLightShadowCameraWorld);
			return u;
		}
		
		public function uniformCameraPos():Var {
			var name:String = "ucamerapos";
			if (getNamedVar(name)) return getNamedVar(name);
			var u:Var = uniform();
			setNamedVar(name, u);
			var binder:GLBinder = new GLBinder(this, u);
			binds.push(binder.bindCameraPosUniform);
			return u;
		}
		public function uniformTime():Var {
			var name:String = "utime";
			if (getNamedVar(name)) return getNamedVar(name);
			var u:Var = uniform();
			setNamedVar(name, u);
			var binder:GLBinder = new GLBinder(this, u);
			binds.push(binder.bindTimeUniform);
			return u;
		}
		public function uniformPixelSize():Var {
			var name:String = "upixelsize";
			if (getNamedVar(name)) return getNamedVar(name);
			var u:Var = uniform();
			setNamedVar(name, u);
			var binder:GLBinder = new GLBinder(this, u);
			binds.push(binder.bindPixelSizeUniform);
			return u;
		}
		public function uniformTextureSize():Var {
			var name:String = "utexturesize";
			if (getNamedVar(name)) return getNamedVar(name);
			var u:Var = uniform();
			setNamedVar(name, u);
			var binder:GLBinder = new GLBinder(this, u);
			binds.push(binder.bindTextureSizeUniform);
			return u;
		}
		public function uniformUVMulAdder():Var {
			var name:String = "uvmuladd";
			if (getNamedVar(name)) return getNamedVar(name);
			var u:Var = uniform();
			setNamedVar(name, u);
			var binder:GLBinder = new GLBinder(this, u);
			binds.push(binder.bindUVMulAddUniform);
			return u;
		}
		
		public function uniformJointsQuat(numJoints:int):Var {
			var name:String = "ujointsquat";
			if (getNamedVar(name)) return getNamedVar(name);
			var u:Var = floatArray(numJoints*2);
			setNamedVar(name, u);
			var binder:GLBinder = new GLBinder(this, u);
			binds.push(binder.bindJointsQuatUniform);
			return u;
		}
		public function uniformJointsMatrix(numJoints:int):Var {
			var name:String = "ujointsmatrix";
			if (getNamedVar(name)) return getNamedVar(name);
			var u:Var = matrixArray(numJoints);
			setNamedVar(name, u);
			var binder:GLBinder = new GLBinder(this, u);
			binds.push(binder.bindJointsMatrixUniform);
			return u;
		}
		public function uniformMaterialColor():Var {
			var name:String = "umaterialcolor";
			if (getNamedVar(name)) return getNamedVar(name);
			var u:Var = uniform();
			setNamedVar(name, u);
			var binder:GLBinder = new GLBinder(this, u);
			binds.push(binder.bindMaterialColorUniform);
			return u;
		}
		public function uniformLightColor(index:int):Var {
			var name:String = "ulightcolor"+index;
			if (getNamedVar(name)) return getNamedVar(name);
			var u:Var = uniform();
			setNamedVar(name, u);
			var binder:GLBinder = new GLBinder(this, u,index);
			binds.push(binder.bindLightColorUniform);
			return u;
		}
		public function uniformLightVar(index:int):Var {
			var name:String = "ulightvar"+index;
			if (getNamedVar(name)) return getNamedVar(name);
			var u:Var = uniform();
			setNamedVar(name, u);
			var binder:GLBinder = new GLBinder(this, u,index);
			binds.push(binder.bindLightColorVar);
			return u;
		}
		public function uniformAmbient():Var {
			var name:String = "uambient";
			if (getNamedVar(name)) return getNamedVar(name);
			var u:Var = uniform();
			setNamedVar(name, u);
			var binder:GLBinder = new GLBinder(this, u);
			binds.push(binder.bindAmbientUniform);
			return u;
		}
		public function uniformSpecular():Var {
			var name:String = "uspecular";
			if (getNamedVar(name)) return getNamedVar(name);
			var u:Var = uniform();
			setNamedVar(name, u);
			var binder:GLBinder = new GLBinder(this, u);
			binds.push(binder.bindSpecularUniform);
			return u;
		}
		public function uniformWireframeColor():Var {
			var name:String = "uwireframecolor";
			if (getNamedVar(name)) return getNamedVar(name);
			var u:Var = uniform()
			setNamedVar(name, u);
			var binder:GLBinder = new GLBinder(this, u);
			binds.push(binder.bindWireframeColorUniform);
			return u;
		}
		
		//textures
		public function samplerDiff():Var {
			var name:String = "sdiff";
			if (getNamedVar(name)) return getNamedVar(name);
			var samp:Var = sampler();
			setNamedVar(name, samp);
			var binder:GLBinder = new GLBinder(this,samp);
			binds.push(binder.bindDiffSampler);
			return samp;
		}
		public function samplerNormalmap():Var {
			var name:String = "snormlmap";
			if (getNamedVar(name)) return getNamedVar(name);
			var samp:Var = sampler();
			setNamedVar(name, samp);
			var binder:GLBinder = new GLBinder(this,samp);
			binds.push(binder.bindNormalmapSampler);
			return samp;
		}
		public function samplerLightmap():Var {
			var name:String = "slightmap";
			if (getNamedVar(name)) return getNamedVar(name);
			var samp:Var = sampler();
			setNamedVar(name, samp);
			var binder:GLBinder = new GLBinder(this,samp);
			binds.push(binder.bindLightmapSampler);
			return samp;
		}
		public function samplerReflect():Var {
			var name:String = "sreflect";
			if (getNamedVar(name)) return getNamedVar(name);
			var samp:Var = sampler();
			setNamedVar(name, samp);
			var binder:GLBinder = new GLBinder(this,samp);
			binds.push(binder.bindReflectSampler);
			return samp;
		}
		public function samplerTerrains(index:int):Var {
			var name:String = "sterrain"+index;
			if (getNamedVar(name)) return getNamedVar(name);
			var samp:Var = sampler();
			setNamedVar(name, samp);
			var binder:GLBinder = new GLBinder(this,samp,index);
			binds.push(binder.bindTerrainsSampler);
			return samp;
		}
		public function samplerShadowmaps(index:int):Var {
			var name:String = "sshadowmap"+index;
			if (getNamedVar(name)) return getNamedVar(name);
			var samp:Var = sampler();
			setNamedVar(name, samp);
			var binder:GLBinder = new GLBinder(this,samp,index);
			binds.push(binder.bindShadowmapsSampler);
			return samp;
		}
		//buffs
		public function buffPos():Var {
			var name:String = "bpos";
			var b:Var = getNamedVar(name);
			if (b) return b;
			b = buff();
			setNamedVar(name, b);
			var binder:GLBinder = new GLBinder(this,b);
			binds.push(binder.bindPosBuff);
			return b;
		}
		public function buffNorm():Var {
			var name:String = "bnorm";
			if (getNamedVar(name)) return getNamedVar(name);
			var b:Var = buff();
			setNamedVar(name, b);
			var binder:GLBinder = new GLBinder(this,b);
			binds.push(binder.bindNormBuff);
			return b;
		}
		public function buffTangent():Var {
			var name:String = "btangent";
			if (getNamedVar(name)) return getNamedVar(name);
			var b:Var = buff();
			setNamedVar(name, b);
			var binder:GLBinder = new GLBinder(this,b);
			binds.push(binder.bindTangentBuff);
			return b;
		}
		public function buffUV():Var {
			var name:String = "buv";
			if (getNamedVar(name)) return getNamedVar(name);
			var b:Var = buff();
			setNamedVar(name, b);
			var binder:GLBinder = new GLBinder(this,b);
			binds.push(binder.bindUVBuff);
			return b;
		}
		public function buffRandom():Var {
			var name:String = "brandom";
			if (getNamedVar(name)) return getNamedVar(name);
			var b:Var = buff();
			setNamedVar(name, b);
			var binder:GLBinder = new GLBinder(this,b);
			binds.push(binder.bindRandomBuff);
			return b;
		}
		public function buffSphereRandom():Var {
			var name:String = "bsrandom";
			if (getNamedVar(name)) return getNamedVar(name);
			var b:Var = buff();
			setNamedVar(name, b);
			var binder:GLBinder = new GLBinder(this,b);
			binds.push(binder.bindSphereRandomBuff);
			return b;
		}
		public function buffTargetPosition():Var {
			var name:String = "btp";
			if (getNamedVar(name)) return getNamedVar(name);
			var b:Var = buff();
			setNamedVar(name, b);
			var binder:GLBinder = new GLBinder(this,b);
			binds.push(binder.bindTargetPositionBuff);
			return b;
		}
		public function buffUV2():Var {
			var name:String = "buv2";
			if (getNamedVar(name)) return getNamedVar(name);
			var b:Var = buff();
			setNamedVar(name, b);
			var binder:GLBinder = new GLBinder(this,b);
			binds.push(binder.bindUV2Buff);
			return b;
		}
		public function buffJoints():Var {
			var name:String = "bjoints";
			if (getNamedVar(name)) return getNamedVar(name);
			var b:Var = buff();
			setNamedVar(name, b);
			var binder:GLBinder = new GLBinder(this,b);
			binds.push(binder.bindJointsBuff);
			return b;
		}
		/*public function buffQuatJoints():Var {
			var name:String = "bqjoints";
			if (getNamedVar(name)) return getNamedVar(name);
			var buff:Var = buff();
			setNamedVar(name, buff);
			var binder:GLBinder = new GLBinder(this,buff);
			binds.push(binder.bindQuatJointsBuff);
			return buff;
		}*/
		public function buffWeights():Var {
			var name:String = "bweights";
			if (getNamedVar(name)) return getNamedVar(name);
			var b:Var = buff();
			setNamedVar(name, b);
			var binder:GLBinder = new GLBinder(this,b);
			binds.push(binder.bindWeightsBuff);
			return b;
		}
		/*public function buffCpuSkinPos():Var {
			var name:String = "bcpuskinpos";
			if (getNamedVar(name)) return getNamedVar(name);
			var buff:Var = buff();
			setNamedVar(name, buff);
			var binder:GLBinder = new GLBinder(this,buff);
			binds.push(binder.bindCpuSkinPosBuff);
			return buff;
		}
		public function buffCpuSkinNorm():Var {
			var name:String = "bcpuskinnorm";
			if (getNamedVar(name)) return getNamedVar(name);
			var buff:Var = buff();
			setNamedVar(name, buff);
			var binder:GLBinder = new GLBinder(this,buff);
			binds.push(binder.bindCpuSkinNormBuff);
			return buff;
		}*/
		public function getNamedVar(name:String):Var {
			return namedVars[name];
		}
		public function setNamedVar(name:String, v:Var):void {
			namedVars[name] = v;
		}
		
	}

}