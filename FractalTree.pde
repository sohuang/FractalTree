private float fractionLength = .8;
private int smallestBranch = 10;
private float branchAngle = .2;

public void setup() {   
	size(640,480);    
	noLoop(); 
}

public void draw() {   
	background(0);   
	stroke(0,255,0);   
	line(320,480,320,380);
	drawBranches(320, 380, 80, branchAngle);
}

public void drawBranches(int x, int y, float branchLength, float angle) {
	float xp = branchLength * sin(90 - angle) + x;
	float yp = y - branchLength * cos(90- angle);
	line(x, y, xp, yp);
	xp = x - (branchLength * sin(90 - angle));
	yp = y - branchLength * cos(90- angle);
	line(x, y, xp, yp);
}
