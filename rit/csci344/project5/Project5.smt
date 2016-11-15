; A usmalltalk program to demonstrate inheritance.
; 
; @author Stephen Allan (swa9846)
; @version November 19, 2016


; Class to represent a shape object.
(class Shape Object

    ; Variables
    (perimeter area)

    ; Public constructor for a shape object.
    (class-method initShape:: (p a)
        (setInitShape:: (new self) p a)
    )

    ; Initialize the value of the shape object's perimeter and area variables. 
    (method setInitShape:: (p a) ; private
        (set perimeter p)
        (set area a)
        self
    )

    ; Returns the perimeter of the shape object.
    (method getPerimeter ()
        perimeter
    )
 
    ; Sets the perimeter of the shape object.
    (method setPerimeter: (p)
        (set perimeter p)
    )

    ; Returns the area of the shape object.
    (method getArea ()
        area
    )

    ; Sets the area of the shape object.
    (method setArea: (a)
        (set area a)
    )
)


; Class to represent a circle object
(class Circle Shape

    ; Variables
    (radius)
    
    ; Public constructor for a circle object.
    ; Properly extends from class Shape.
    (class-method initCircle: (r)
        (setInitCircle:
            (initShape:: super
                (calculateCircumference: Circle r)
                (calculateArea: Circle r)
            )
            r
        )
    )

    ; Method used to calculate the value of a circle's circumference given its radius.
    ; Uses the formula: 2 * pi * radius
    (class-method calculateCircumference: (r)
        (* (* (asFloat 2) (asFloat (/ 355 113))) (asFloat r))
    )

    ; Method used to calculate the value of a circle's area given its radius.
    ; Uses the formula: pi * radius^2
    (class-method calculateArea: (r)
        (* (asFloat (/ 355 113)) (asFloat (* r r)))
    )

    ; Initialize the value of the circle object's radius variable.
    (method setInitCircle: (r) ; private
        (set radius r)
        self
    )

    ; Returns the radius of the circle object.
    (method getRadius ()
        radius 
    )

    ; Sets the radius of the circle object.
    ; Properly updates field values in the parent class.
    (method setRadius: (r)
        (setPerimeter: super (calculateCircumference: Circle r))
        (setArea: super (calculateArea: Circle r))
        (set radius r)
    )
)


; Class to represent a rectangle object.
(class Rectangle Shape

    ; Variables
    (length width)

    ; Public constructor for a rectangle object.
    ; Properly extends from class Shape.
    (class-method initRectangle:: (l w)
        (setInitRectangle::
            (initShape:: super
                (calculatePerimeter:: Rectangle l w)
                (calculateArea:: Rectangle l w)
            )
            l w
        )
    )

    ; Method used to calculate the value of a rectangle's perimeter given its length and width.
    ; Uses the formula: 2 * (length + width)
    (class-method calculatePerimeter:: (l w)
        (* 2 (+ l w))
    )

    ; Method used to calculate the value of a rectangle's area given its length and width.
    ; Uses the formula: length * width
    (class-method calculateArea:: (l w)
        (* l w)
    )

    ; Initialize the value of the rectangle object's length and width variables. 
    (method setInitRectangle:: (l w) ; private
        (set length l)
        (set width w)
        self
    )

    ; Returns the length of the rectangle object.
    (method getLength ()
        length
    )

    ; Sets the length of the rectangle object.
    ; Properly updates field values in the parent class.
    (method setLength: (l)
        (setPerimeter: super (calculatePerimeter:: Rectangle l width))
        (setArea: super (calculateArea:: Rectangle l width))
        (set length l)
    )

    ; Returns the width of the rectangle object.
    (method getWidth ()
        width
    )

    ; Sets the width of the rectangle object.
    ; Properly updates field values in the parent class.
    (method setWidth: (w)
        (setPerimeter: super (calculatePerimeter:: Rectangle length w))
        (setArea: super (calculateArea:: Rectangle length w))
        (set width w)
    )
)


; Class to represent a square object.
(class Square Rectangle

    ; Variables
    (side)

    ; Public constructor for a square object.
    ; Properly extends from class Rectangle.
    (class-method initSquare: (s)
        (setInitSquare:
            (initRectangle:: super s s)
            s
        )
    )

    ; Initialize the value of the square object's side variable. 
    (method setInitSquare: (s) ; private
        (set side s)
        self
    )

    ; Returns the side of the square object.
    (method getSide ()
        side
    )

    ; Sets the side of the square object.
    ; Properly updates field values in the parent class.
    (method setSide: (s)
        (setLength: super s)
        (setWidth: super s)
        (set side s)
    )
)


; Class to represent a triangle object.
(class Triangle Shape

    ; Variables
    (side1 side2 side3 base height)

    ; Public constructor for a triangle object.
    ; Properly extends from class Shape.
    (class-method initTriangle::::: (s1 s2 s3 b h)
        (setInitTriangle:::::
            (initShape:: super
                (calculatePerimeter::: Triangle s1 s2 s3 )
                (calculateArea:: Triangle b h)
            )
            s1 s2 s3 b h
        )
    )

    ; Method used to calculate the value of a triangle's perimeter given its sides.
    ; Uses the formula: side1 + side2 + side3
    (class-method calculatePerimeter::: (s1 s2 s3)
        (+ ( + s1 s2) s3)
    )

    ; Method used to calculate the value of a triangle's area given its base and height.
    ; Uses the formula: (base * height) / 2
    (class-method calculateArea:: (b h)
        (/ (* b h) 2)
    )

    ; Initialize the value of the triangle object's sides, base, and height variables. 
    (method setInitTriangle::::: (s1 s2 s3 b h) ; private
        (set side1 s1)
        (set side2 s2)
        (set side3 s3)
        (set base b)
        (set height h)
        self
    )

    ; Returns side1 of the triangle object.
    (method getSide1 ()
        side1
    )

    ; Returns side2 of the triangle object.
    (method getSide2 ()
        side2
    )

    ; Returns side3 of the triangle object.
    (method getSide3 ()
        side3
    )

    ; Sets the sides of the triangle object.
    ; Properly updates field values in the parent class.
    (method setSides::: (s1 s2 s3)
        (setPerimeter: super (calculatePerimeter::: Triangle s1 s2 s3))
        (set side1 s1)
        (set side2 s2)
        (set side3 s3)
    )

    ; Returns the base of the triangle object.
    (method getBase ()
        base
    )

    ; Returns the height of the triangle object.
    (method getHeight ()
        height
    )

    ; Sets the base and height of the triangle object.
    ; Properly updates field values in the parent class.
    (method setBaseHeight:: (b h)
        (setArea: super (calculateArea:: Triangle b h))
        (set base b)
        (set height h)
    )

)



; Example usages:

; Static methods.
(calculateCircumference: Circle 40)
(calculateArea: Circle 40)
(calculatePerimeter:: Rectangle 40 50)
(calculateArea:: Rectangle 40 50)
(calculatePerimeter::: Triangle 40 50 60)
(calculateArea:: Triangle 40 50)


; Object methods.
(val shape (initShape:: Shape 5 10))
(getPerimeter shape)
(getArea shape)
(setPerimeter: shape 25)
(setArea: shape 50)
(getPerimeter shape)
(getArea shape)

(val circle (initCircle: Circle 15))
(getPerimeter circle)
(getArea circle)
(getRadius circle)
(setRadius: circle 30)
(getPerimeter circle)
(getArea circle)
(getRadius circle)

(val rectangle (initRectangle:: Rectangle 5 10))
(getPerimeter rectangle)
(getArea rectangle)
(getLength rectangle)
(getWidth rectangle)
(setLength: rectangle 20)
(setWidth: rectangle 30)
(getPerimeter rectangle)
(getArea rectangle)
(getLength rectangle)
(getWidth rectangle)

(val square (initSquare: Square 7))
(getPerimeter square)
(getArea square)
(getLength square)
(getWidth square)
(getSide square)
(setSide: square 15)
(getPerimeter square)
(getArea square)
(getLength square)
(getWidth square)
(getSide square)

(val triangle (initTriangle::::: Triangle 5 3 14 7 20))
(getPerimeter triangle)
(getArea triangle)
(getSide1 triangle)
(getSide2 triangle)
(getSide3 triangle)
(getBase triangle)
(getHeight triangle)
(setSides::: triangle 4 13 9)
(setBaseHeight:: triangle 7 8)
(getPerimeter triangle)
(getArea triangle)
(getSide1 triangle)
(getSide2 triangle)
(getSide3 triangle)
(getBase triangle)
(getHeight triangle)

