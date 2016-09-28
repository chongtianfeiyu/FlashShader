package gl3d.core {
	import com.adobe.utils.PerspectiveMatrix3D;
	import flash.display3D.Context3D;
	import flash.geom.Matrix3D;
	import flash.geom.Vector3D;
	/**
	 * ...
	 * @author lizhi
	 */
	public class Camera3D extends Node3D
	{
		public var perspective:Matrix3D = new PerspectiveMatrix3D;
		private var p:PerspectiveMatrix3D = perspective as PerspectiveMatrix3D;
		private var _view:Matrix3D = new Matrix3D;
		public function Camera3D(name:String=null ) 
		{
			super(name);
		}
		
		public function computePickRayDirectionMouse( mouseX:Number, mouseY:Number,viewWidth:Number,viewHeight:Number ,rayOrigin:Vector3D, rayDirection:Vector3D, pixelPos:Vector3D=null ):void
		{
			var x:Number =  (mouseX - viewWidth *.5) / viewWidth *2;
			var y:Number = -(mouseY - viewHeight * .5) / viewHeight * 2;
			return computePickRayDirection(x, y, rayOrigin, rayDirection, pixelPos);
		}
		
		public function computePickRayDirection( x:Number, y:Number, rayOrigin:Vector3D, rayDirection:Vector3D, pixelPos:Vector3D=null ):void
		{
			// unproject
			// screen -> camera -> world
			
			var prjPos:Vector3D=new Vector3D( x, y, 0 ); // clip space
			var unprjMatrix:Matrix3D = perspective.clone();;
			unprjMatrix.invert();
			unprjMatrix.append(world);
			
			// screen -> camera -> world
			var pos:Vector3D = unprjMatrix.transformVector(prjPos);
			pos.project();// .scaleBy(1 / pos.w);
			
			if ( pixelPos!=null )
				pixelPos.setTo( pos.x, pos.y, pos.z );
			
			rayOrigin.setTo( this.x, this.y, this.z );
			
			// compute ray
			rayDirection.setTo(	pos.x - this.x,
				pos.y - this.y,
				pos.z - this.z );
			rayDirection.normalize();
		}
		
		public function perspectiveLH(width:Number, 
									  height:Number, 
									  zNear:Number, 
									  zFar:Number):void {
			p.perspectiveLH(width, height, zNear, zFar);
		}

		public function perspectiveRH(width:Number, 
									  height:Number, 
									  zNear:Number, 
									  zFar:Number):void {
			p.perspectiveRH(width, height, zNear, zFar);
		}

		public function perspectiveFieldOfViewLH(fieldOfViewY:Number, 
												 aspectRatio:Number, 
												 zNear:Number, 
												 zFar:Number):void {
			p.perspectiveFieldOfViewLH(fieldOfViewY, aspectRatio, zNear, zFar);
		}

		public function perspectiveFieldOfViewRH(fieldOfViewY:Number, 
												 aspectRatio:Number, 
												 zNear:Number, 
												 zFar:Number):void {
			p.perspectiveFieldOfViewRH(fieldOfViewY, aspectRatio, zNear, zFar);
		}

		public function perspectiveOffCenterLH(left:Number, 
									 		   right:Number,
									  		   bottom:Number,
									           top:Number,
									  		   zNear:Number, 
									  		   zFar:Number):void {
			p.perspectiveOffCenterLH(left, right, bottom, top, zNear, zFar);
		}

		public function perspectiveOffCenterRH(left:Number, 
											   right:Number,
											   bottom:Number,
											   top:Number,
											   zNear:Number, 
											   zFar:Number):void {
			p.perspectiveOffCenterRH(left, right, bottom, top, zNear, zFar);
		}
		
		public function orthoLH(width:Number,
								height:Number,
								zNear:Number,
								zFar:Number):void {
			p.orthoLH(width, height, zNear, zFar);
		}

		public function orthoRH(width:Number,
								height:Number,
								zNear:Number,
								zFar:Number):void {
			p.orthoRH(width, height, zNear, zFar);
		}

		public function orthoOffCenterLH(left:Number, 
										 right:Number,
										 bottom:Number,
									     top:Number,
										 zNear:Number, 
										 zFar:Number):void {
			p.orthoOffCenterLH(left, right, bottom, top, zNear, zFar);
		}

		public function orthoOffCenterRH(left:Number, 
										 right:Number,
										 bottom:Number,
										 top:Number,
										 zNear:Number, 
										 zFar:Number):void {
			p.orthoOffCenterRH(left, right, bottom, top, zNear, zFar);
		}
		
	}

}