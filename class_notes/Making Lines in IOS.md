We can have multiple touches at the same time, which is why touches is an NSSet

In a DrawingView.m,


	@property CGPoint startOfLine;
	@property CGPoint endOfLine;

	touchesBegan: (NSSet *)touches … {
		UITouch *touch = [touches anyObject];
		startofLine = [touch locationInView:self]; // Returns a CGPoint.
	}

For now, we're just dealing with one action.

	// End of line is being updated every time I move my finger.
	touchesMoved:(NSSet *)touches … {
		UITouch *touch = [touches anyObject];
		self.endOfLine = [touch locationInView:self];

	}

We get three methods here:
touchesBegin, touchesMoved, touchesEnded

But the code as is doesn't draw anything. So we add a drawRect code here

	-(void)drawInRect {
		// Start drawing. Redraw the screen
		// Change the start of line.
		// As you move your finger, endOfLineChanges
	}

To make it so that we can draw multiple lines, we'll probably have to make a line class.

Something like,

	@interface Line;
		@property CGPoint start;
		@property CGPoint end;
		-(void)drawLine:(CGContextRect)context;
	@end

Then, when we have the touchesEnded code,

	touchesEnded {
		// Construct the line.
		// completed lines add object:newLine
		// Newline = nil;
	}









