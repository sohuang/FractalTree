private float fractionLength = .8;
private int smallestBranch = 10;
private float branchAngle = .2;
public float seed = 0;
float angle;

public void setup() {
	size(640,480);
	background(0);
	noLoop();
}

public void draw() {
	stroke(0,255,0);
	translate(width/2, height);
	branch(100);
	seed += 0.05;
}

public void branch(float len) {
	seed += 0.05;
	angle += map(noise(len, seed), 0, 1, -1, 1);
	println(angle);
	line(0, 0, 0, -len);
	translate(0, -len);
	if (len > 4) {
		pushMatrix();
		rotate(angle);
		branch(len * 0.67);
		popMatrix();

		pushMatrix();
		rotate(-angle);
		branch(len * 0.67);
		popMatrix();
	}
}

void mousePressed() {
	background(0);		
	branch(100);
}