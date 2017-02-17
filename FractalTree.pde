private double fractionLength = .8;
private int smallestBranch = 10;
private double branchAngle = .5;
private float h, s, b;
private float count;
private float seed1 = 75;
private float seed2 = 150;

public void setup() {
	size(640, 480);
	background(0);
	colorMode(HSB);
	// noLoop();
}

public void draw() {
	background(200);
	h = map(noise(count), 0, 1, 0, 255);
	s = map(noise(count), 0, 1, 255, 0);
	b = map(noise(count), 0, 1, 100, 255);
	stroke(h, s, b);
	line(320, 480, 320, 380);
	drawBranches(320, 380, 100, 3 * Math.PI/2);
}

public void drawBranches(int x, int y, double branchLength, double angle) {
	count += 0.000001;
	seed1 += 0.000005;
	seed2 += 0.000008;

	// double angle1 = angle + branchAngle;
	// double angle2 = angle - branchAngle;

	double angle1 = angle + noise(seed1);
	double angle2 = angle - noise(seed2);

	branchLength *= fractionLength;

	int endX1 = (int)(branchLength * Math.cos(angle1) + x);
	int endY1 = (int)(branchLength * Math.sin(angle1) + y);

	int endX2 = (int)(branchLength * Math.cos(angle2) + x);
	int endY2 = (int)(branchLength * Math.sin(angle2) + y);

	line(x, y, endX1, endY1);
	line(x, y, endX2, endY2);

	if (branchLength > smallestBranch) {
		drawBranches(endX1, endY1, branchLength, angle1);
		drawBranches(endX2, endY2, branchLength, angle2);
	}
}

void mousePressed() {

}