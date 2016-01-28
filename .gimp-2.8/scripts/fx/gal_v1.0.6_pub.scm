;GAL (Gimp Abstarction Layer) v1.0.6
;
;GAL source code is completely free. You can use it for any purpose.
;
;===================================================================GAL API revision 1 specs===========================================================================
;#	GIMP 2.6						GAL						GIMP 2.7/GIMP 2.8
;======================================================================================================================================================================
;
;#1	gimp-image-get-layer-position				gal-image-get-item-position			gimp-image-get-item-position
;	gimp-image-get-vectors-position
;
;#2	gimp-image-lower-layer					gal-image-lower-item				gimp-image-lower-item
;	gimp-image-lower-vectors
;
;#3	gimp-image-lower-layer-to-bottom			gal-image-lower-item-to-bottom			gimp-image-lower-item-to-bottom
;	gimp-image-lower-vectors-to-bottom
;
;#4	gimp-image-raise-layer					gal-image-raise-item				gimp-image-raise-item
;	gimp-image-raise-vectors
;
;#5	gimp-image-raise-layer-to-top				gal-image-raise-item-to-top			gimp-image-raise-item-to-top
;	gimp-image-raise-vectors-to-top
;
;---	N/A							N/A						gimp-image-reorder-item
;
;#6	gimp-drawable-delete					gal-item-delete					gimp-item-delete
;
;---	N/A							N/A						gimp-item-get-children
;
;#7	gimp-drawable-get-image					gal-item-get-image				gimp-item-get-image
;	gimp-vectors-get-image
;
;#8	gimp-drawable-get-linked				gal-item-get-linked				gimp-item-get-linked
;	gimp-vectors-get-linked
;
;---	N/A							N/A						gimp-item-get-lock-content
;
;#9	gimp-drawable-get-name					gal-item-get-name				gimp-item-get-name
;	gimp-vectors-get-name
;
;---	N/A							N/A						gimp-item-get-parent
;
;#10	gimp-drawable-get-tattoo				gal-item-get-tattoo				gimp-item-get-tattoo
;	gimp-vectors-get-visible
;
;#11	gimp-drawable-get-visible				gal-item-get-visible				gimp-item-get-visible
;	gimp-vectors-get-visible
;
;#12	gimp-drawable-is-channel				gal-item-is-channel				gimp-item-is-channel
;
;---	N/A							N/A						gimp-item-is-drawable
;
;---	N/A							N/A						gimp-item-is-group
;
;#13	gimp-drawable-is-layer					gal-item-is-layer				gimp-item-is-layer
;
;#14	gimp-drawable-is-layer-mask				gal-item-is-layer-mask				gimp-item-is-layer-mask
;
;---	N/A							N/A						gimp-item-is-selection
;
;#15	gimp-drawable-is-text-layer				gal-item-is-text-layer				gimp-item-is-text-layer
;
;#16	gal-drawable-is-valid					gal-item-is-valid				gimp-item-is-valid
;	gimp-vectors-is-valid
;
;---	N/A							N/A						gimp-item-is-vectors
;
;#17	gimp-drawable-parasite-attach				gal-item-parasite-attach			gimp-item-parasite-attach
;	gimp-vectors-parasite-attach
;
;#18	gimp-drawable-parasite-detach				gal-item-parasite-detach			gimp-item-parasite-detach
;	gimp-vectors-parasite-detach
;
;#19	gimp-drawable-parasite-find				gal-item-parasite-find				gimp-item-parasite-find
;	gimp-vectors-parasite-find
;
;#20	gimp-drawable-parasite-list				gal-item-parasite-list				gimp-item-parasite-list
;	gimp-vectors-parasite-list
;
;#21	gimp-drawable-set-linked				gal-item-set-linked				gimp-item-set-linked
;	gimp-vectors-set-linked
;
;---	N/A							N/A						gimp-item-set-lock-content
;
;#22	gimp-drawable-set-name					gal-item-set-name				gimp-item-set-name
;	gimp-vectors-set-name
;
;#23	gimp-drawable-set-tattoo				gal-item-set-tattoo				gimp-item-set-tattoo
;	gimp-vectors-set-tattoo
;
;#24	gimp-drawable-set-visible				gal-item-set-visible				gimp-item-set-visible
;	gimp-vectors-set-visible
;
;#25	gimp-vectors-to-selection				gal-item-to-selection				gimp-item-to-selection
;
;#26	gimp-drawable-transform-2d				gal-item-transform-2d				gimp-item-transform-2d
;
;#27	gimp-drawable-transform-flip				gal-item-transform-flip				gimp-item-transform-flip
;
;#28	gimp-drawable-transform-flip-simple			gal-item-transform-flip-simple			gimp-item-transform-flip-simple
;
;#29	gimp-drawable-transform-matrix				gal-item-transform-matrix			gimp-item-transform-matrix
;
;#30	gimp-drawable-transform-rotate				gal-item-transform-rotate			gimp-item-transform-rotate
;
;#31	gimp-drawable-transform-scale				gal-item-transform-scale			gimp-item-transform-scale
;
;#32	gimp-drawable-transform-shear				gal-item-transform-shear			gimp-item-transform-shear
;
;#33	gimp-image-add-channel					gal-image-insert-channel			gimp-image-insert-channel
;
;#34	gimp-image-add-layer					gal-image-insert-layer				gimp-image-insert-layer
;
;#35	gimp-image-add-vectors					gal-image-insert-vectors			gimp-image-insert-vectors
;======================================================================================================================================================================

;Global vaiables

;Current API revision
(define gal-revision 1)

;Current GAL version
(define gal-version "v1.0.6")

;API state description
(define gal-description "GIMP 2.7.2 (10.30.2010) from GIT")

;GAL official URL
(define gal-url "http://registry.gimp.org/node/24833")

;GAL author
(define gal-credits
  (list
    "Nepochatov Stanislav"
    "Free for any purpose"
    "November 2 2010"
  )
)

(define (gal-info)
  (gimp-message 
    (string-append
      "GAL (Gimp Abstraction Layer) " gal-version "\n"
      "\n"
      "GAL API revision - " (number->string gal-revision) "\n"
      "Currently GAL is complitable with GIMP 2.6\n"
      "and with " gal-description ".\n"
      "GAL contain 35 API independent functions."
    )
  )
)

(apply script-fu-register
  (append
    (list
      "gal-info"
      _"<Image>/Filters/RSS/About GAL"
      "Display info about GAL"
    )
    gal-credits
    (list
    ""
    )
  )
)

;GAL fuctions

;Function #1
(define (gal-image-get-item-position input_var1 input_var2)
(define output-return)
  (if (defined? 'gimp-image-get-item-position)
    (set! output-return (gimp-image-get-item-position input_var1 input_var2))
    (if (= (car (gimp-drawable-is-layer input_var2)) TRUE)
      (set! output-return (gimp-image-get-layer-position input_var1 input_var2))
      (set! output-return (gimp-image-get-vectors-position input_var1 input_var2))
    )
  )
output-return
)

(apply script-fu-register
  (append
    (list
      "gal-image-get-item-position"
      "gal-image-get-item-position"
      (string-append
	"GIMP API independent procedure\n"
	"Returns the position of the item in its level of its item tree."
      )
    )
    gal-credits
    (list
    ""
    SF-IMAGE		"The image"				0
    SF-DRAWABLE		"The item/drawable/vector"		0
    )
  )
)

;Function #2
(define (gal-image-lower-item input_var1 input_var2)
  (if (defined? 'gimp-image-lower-item)
    (gimp-image-lower-item input_var1 input_var2)
    (if (= (car (gimp-drawable-is-layer input_var2)) TRUE)
      (gimp-image-lower-layer input_var1 input_var2)
      (gimp-image-lower-vectors input_var1 input_var2)
    )
  )
)

(apply script-fu-register
  (append
    (list
      "gal-image-lower-item"
      "gal-image-lower-item"
      (string-append
	"GIMP API independent procedure\n"
	"Lower the specified item in its level in its item tree.\n"
	"It has no return values."
      )
    )
    gal-credits
    (list
    ""
    SF-IMAGE		"The image"				0
    SF-DRAWABLE		"The item/drawable/vector"		0
    )
  )
)

;Function #3
(define (gal-image-lower-item-to-bottom input_var1 input_var2)
  (if (defined? 'gimp-image-lower-item-to-bottom)
    (gimp-image-lower-item-to-bottom input_var1 input_var2)
    (if (= (car (gimp-drawable-is-layer input_var2)) TRUE)
      (gimp-image-lower-layer-to-bottom input_var1 input_var2)
      (gimp-image-lower-vectors-to-bottom input_var1 input_var2)
    )
  )
)

(apply script-fu-register
  (append
    (list
      "gal-image-lower-item-to-bottom"
      "gal-image-lower-item-to-bottom"
      (string-append
	"GIMP API independent procedure\n"
	"Lower the specified item to the bottom of its level in its item tree.\n"
	"It has no return values."
      )
    )
    gal-credits
    (list
    ""
    SF-IMAGE		"The image"				0
    SF-DRAWABLE		"The item/drawable/vector"		0
    )
  )
)

;Function #4
(define (gal-image-raise-item input_var1 input_var2)
  (if (defined? 'gimp-image-raise-item)
    (gimp-image-raise-item input_var1 input_var2)
    (if (= (car (gimp-drawable-is-layer input_var2)) TRUE)
      (gimp-image-raise-layer input_var1 input_var2)
      (gimp-image-raise-vectors input_var1 input_var2)
    )
  )
)

(apply script-fu-register
  (append
    (list
      "gal-image-raise-item"
      "gal-image-raise-item"
      (string-append
	"GIMP API independent procedure\n"
	"Raise the specified item in its level in its item tree.\n"
	"It has no return values."
      )
    )
    gal-credits
    (list
    ""
    SF-IMAGE		"The image"				0
    SF-DRAWABLE		"The item/drawable/vector"		0
    )
  )
)

;Function #5
(define (gal-image-raise-item-to-top input_var1 input_var2)
  (if (defined? 'gimp-image-raise-item-to-bottom)
    (gimp-image-raise-item-to-bottom input_var1 input_var2)
    (if (= (car (gimp-drawable-is-layer input_var2)) TRUE)
      (gimp-image-raise-layer-to-bottom input_var1 input_var2)
      (gimp-image-raise-vectors-to-bottom input_var1 input_var2)
    )
  )
)

(apply script-fu-register
  (append
    (list
      "gal-image-raise-item-to-top"
      "gal-image-raise-item-to-top"
      (string-append
	"GIMP API independent procedure\n"
	"Raise the specified item to the top of its level in its item tree.\n"
	"It has no return values."
      )
    )
    gal-credits
    (list
    ""
    SF-IMAGE		"The image"				0
    SF-DRAWABLE		"The item/drawable/vector"		0
    )
  )
)

;Function #6
(define (gal-item-delete input_item)
  (if (defined? 'gimp-item-delete)
    (gimp-item-delete input_item)
    (gimp-drawable-delete input_item)
  )
)

(apply script-fu-register
  (append
    (list
      "gal-item-delete"
      "gal-item-delete"
      (string-append
	"GIMP API independent procedure\n"
	"Delete a item.\n"
	"Returns nothing."
      )
    )
    gal-credits
    (list
    ""
    SF-DRAWABLE		"The item/drawable/vector"		0
    )
  )
)

;Function #7
(define (gal-item-get-image input_item)
(define output-return)
  (if (defined? 'gimp-item-get-image)
    (set! output-return (gimp-item-get-image input_item))
    (if (= (car (gimp-drawable-is-layer input_item)) TRUE)
      (set! output-return (gimp-drawable-get-image input_item))
      (set! output-return (gimp-vectors-get-image input_item))
    )
  )
output-return
)

(apply script-fu-register
  (append
    (list
      "gal-item-get-image"
      "gal-item-get-image"
      (string-append
	"GIMP API independent procedure\n"
	"This procedure returns the item's image."
      )
    )
    gal-credits
    (list
    ""
    SF-DRAWABLE		"The item/drawable/vector"		0
    )
  )
)

;Function #8
(define (gal-item-get-linked input_item)
(define output-return)
  (if (defined? 'gimp-item-get-linked)
    (set! output-return (gimp-item-get-linked input_item))
    (if (= (car (gimp-drawable-is-layer input_item)) TRUE)
      (set! output-return (gimp-drawable-get-linked input_item))
      (set! output-return (gimp-vectors-get-linked input_item))
    )
  )
output-return
)

(apply script-fu-register
  (append
    (list
      "gal-item-get-linked"
      "gal-item-get-linked"
      (string-append
	"GIMP API independent procedure\n"
	"This procedure returns the specified item's linked state."
      )
    )
    gal-credits
    (list
    ""
    SF-DRAWABLE		"The item/drawable/vector"		0
    )
  )
)

;Function #9
(define (gal-item-get-name input_item)
(define output-return)
  (if (defined? 'gimp-item-get-name)
    (set! output-return (gimp-item-get-name input_item))
    (if (= (car (gimp-drawable-is-layer input_item)) TRUE)
      (set! output-return (gimp-drawable-get-name input_item))
      (set! output-return (gimp-vectors-get-name input_item))
    )
  )
output-return
)

(apply script-fu-register
  (append
    (list
      "gal-item-get-name"
      "gal-item-get-name"
      (string-append
	"GIMP API independent procedure\n"
	"This procedure returns the specified item's name."
      )
    )
    gal-credits
    (list
    ""
    SF-DRAWABLE		"The item/drawable/vector"		0
    )
  )
)

;Function #10
(define (gal-item-get-tattoo input_item)
(define output-return)
  (if (defined? 'gimp-item-get-tattoo)
    (set! output-return (gimp-item-get-tattoo input_item))
    (if (= (car (gimp-drawable-is-layer input_item)) TRUE)
      (set! output-return (gimp-drawable-get-tattoo input_item))
      (set! output-return (gimp-vectors-get-tattoo input_item))
    )
  )
output-return
)

(apply script-fu-register
  (append
    (list
      "gal-item-get-tattoo"
      "gal-item-get-tattoo"
      (string-append
	"GIMP API independent procedure\n"
	"This procedure returns the specified item's tattoo.\n"
	"A tattoo is a unique and permanent identifier\n"
	"attached to a item that can be used to uniquely \n"
	"identify a item within an image even between sessions."
      )
    )
    gal-credits
    (list
    ""
    SF-DRAWABLE		"The item/drawable/vector"		0
    )
  )
)

;Function #11
(define (gal-item-get-visible input_item)
(define output-return)
  (if (defined? 'gimp-item-get-visible)
    (set! output-return (gimp-item-get-visible input_item))
    (if (= (car (gimp-drawable-is-layer input_item)) TRUE)
      (set! output-return (gimp-drawable-get-visible input_item))
      (set! output-return (gimp-vectors-get-visible input_item))
    )
  )
output-return
)

(apply script-fu-register
  (append
    (list
      "gal-item-get-visible"
      "gal-item-get-visible"
      (string-append
	"GIMP API independent procedure\n"
	"This procedure returns the specified item's visibility."
      )
    )
    gal-credits
    (list
    ""
    SF-DRAWABLE		"The item/drawable/vector"		0
    )
  )
)

;Function #12
(define (gal-item-is-channel input_item)
(define output-return)
  (if (defined? 'gimp-item-is-channel)
    (set! output-return (gimp-item-is-channel input_item))
    (set! output-return (gimp-drawable-is-channel input_item))
  )
output-return
)

(apply script-fu-register
  (append
    (list
      "gal-item-is-channel"
      "gal-item-is-channel"
      (string-append
	"GIMP API independent procedure\n"
	"This procedure returns TRUE if the specified item is a channel."
      )
    )
    gal-credits
    (list
    ""
    SF-DRAWABLE		"The item/drawable/vector"		0
    )
  )
)

;Function #13
(define (gal-item-is-layer input_item)
(define output-return)
  (if (defined? 'gimp-item-is-layer)
    (set! output-return (gimp-item-is-layer input_item))
    (set! output-return (gimp-drawable-is-layer input_item))
  )
output-return
)

(apply script-fu-register
  (append
    (list
      "gal-item-is-layer"
      "gal-item-is-layer"
      (string-append
	"GIMP API independent procedure\n"
	"This procedure returns TRUE if the specified item is a layer."
      )
    )
    gal-credits
    (list
    ""
    SF-DRAWABLE		"The item/drawable/vector"		0
    )
  )
)

;Function #14
(define (gal-item-is-layer-mask input_item)
(define output-return)
  (if (defined? 'gimp-item-is-layer-mask)
    (set! output-return (gimp-item-is-layer-mask input_item))
    (set! output-return (gimp-drawable-is-layer-mask input_item))
  )
output-return
)

(apply script-fu-register
  (append
    (list
      "gal-item-is-layer-mask"
      "gal-item-is-layer-mask"
      (string-append
	"GIMP API independent procedure\n"
	"This procedure returns TRUE if the specified item is a layer mask."
      )
    )
    gal-credits
    (list
    ""
    SF-DRAWABLE		"The item/drawable/vector"		0
    )
  )
)

;Function #15
(define (gal-item-is-text-layer input_item)
(define output-return)
  (if (defined? 'gimp-item-is-text-layer)
    (set! output-return (gimp-item-is-text-layer input_item))
    (set! output-return (gimp-drawable-is-text-layer input_item))
  )
output-return
)

(apply script-fu-register
  (append
    (list
      "gal-item-is-text-layer"
      "gal-item-is-text-layer"
      (string-append
	"GIMP API independent procedure\n"
	"Returns whether the item is a text layer."
      )
    )
    gal-credits
    (list
    ""
    SF-DRAWABLE		"The item/drawable/vector"		0
    )
  )
)

;Function #16
(define (gal-item-is-valid input_item)
(define output-return)
  (if (defined? 'gimp-item-is-valid)
    (set! output-return (gimp-item-is-valid input_item))
    (if (= (car (gimp-drawable-is-layer input_item)) TRUE)
      (set! output-return (gimp-drawable-is-valid input_item))
      (set! output-return (gimp-vectors-is-valid input_item))
    )
  )
output-return
)

(apply script-fu-register
  (append
    (list
      "gal-item-is-valid"
      "gal-item-is-valid"
      (string-append
	"GIMP API independent procedure\n"
	"This procedure checks if the given item ID is valid and refers to an existing item."
      )
    )
    gal-credits
    (list
    ""
    SF-DRAWABLE		"The item/drawable/vector"		0
    )
  )
)

;Function #17
(define (gal-item-parasite-attach input_item input_parasite)
  (if (defined? 'gimp-item-parasite-attach)
    (gimp-item-parasite-attach input_item input_parasite)
    (if (= (car (gimp-drawable-is-layer input_item)) TRUE)
      (gimp-drawable-parasite-attach input_item input_parasite)
      (gimp-vectors-parasite-attach input_item input_parasite)
    )
  )
)

(apply script-fu-register
  (append
    (list
      "gal-item-parasite-attach"
      "gal-item-parasite-attach"
      (string-append
	"GIMP API independent procedure\n"
	"This procedure attaches a parasite to an item.\n"
	"It has no return values."
      )
    )
    gal-credits
    (list
    ""
    SF-DRAWABLE		"The item/drawable/vector"		0
    SF-STRING		"Parasite (PARASITE TYPE)"		""
    )
  )
)

;Function #18
(define (gal-item-parasite-detach input_item input_name)
  (if (defined? 'gimp-item-parasite-detach)
    (gimp-item-parasite-detach input_item input_name)
    (if (= (car (gimp-drawable-is-layer input_item)) TRUE)
      (gimp-drawable-parasite-detach input_item input_name)
      (gimp-vectors-parasite-detach input_item input_name)
    )
  )
)

(apply script-fu-register
  (append
    (list
      "gal-item-parasite-detach"
      "gal-item-parasite-detach"
      (string-append
	"GIMP API independent procedure\n"
	"This procedure detaches a parasite from an item."
	"It has no return values."
      )
    )
    gal-credits
    (list
    ""
    SF-DRAWABLE		"The item/drawable/vector"		0
    SF-STRING		"The parasite name"			""
    )
  )
)

;Function #19
(define (gal-item-parasite-find input_item input_name)
(define output-return)
  (if (defined? 'gimp-item-parasite-find)
    (set! output-return (gimp-item-parasite-find input_item input_name))
    (if (= (car (gimp-drawable-is-layer input_item)) TRUE)
      (set! output-return (gimp-drawable-parasite-find input_item input_name))
      (set! output-return (gimp-vectors-parasite-find input_item input_name))
    )
  )
output-return
)

(apply script-fu-register
  (append
    (list
      "gal-item-parasite-find"
      "gal-item-parasite-find"
      (string-append
	"GIMP API independent procedure\n"
	"Finds and returns the parasite that is attached to an item."
      )
    )
    gal-credits
    (list
    ""
    SF-DRAWABLE		"The item/drawable/vector"		0
    SF-STRING		"The name of the parasite to find"	""
    )
  )
)

;Function #20
(define (gal-item-parasite-list input_item)
(define output-return)
  (if (defined? 'gimp-item-parasite-list)
    (set! output-return (gimp-item-parasite-list input_item))
    (if (= (car (gimp-drawable-is-layer input_item)) TRUE)
      (set! output-return (gimp-drawable-parasite-list input_item))
      (set! output-return (gimp-vectors-parasite-list input_item))
    )
  )
output-return
)

(apply script-fu-register
  (append
    (list
      "gal-item-parasite-list"
      "gal-item-parasite-list"
      (string-append
	"GIMP API independent procedure\n"
	"Returns a number (INT32) and list (STRINGARRAY) of all\n"
	"parasites currently attached the an item."
      )
    )
    gal-credits
    (list
    ""
    SF-DRAWABLE		"The item/drawable/vector"		0
    )
  )
)

;Function #21
(define (gal-item-set-linked input_item input_var1)
  (if (defined? 'gimp-item-set-linked)
    (gimp-item-set-linked input_item input_var1)
    (if (= (car (gimp-drawable-is-layer input_item)) TRUE)
      (gimp-drawable-set-linked input_item input_var1)
      (gimp-vectors-set-linked input_item input_var1)
    )
  )
)

(apply script-fu-register
  (append
    (list
      "gal-item-set-linked"
      "gal-item-set-linked"
      (string-append
	"GIMP API independent procedure\n"
	"This procedure sets the specified item's linked state.\n"
	"It has no return values."
      )
    )
    gal-credits
    (list
    ""
    SF-DRAWABLE		"The item/drawable/vector"		0
    SF-STRING		"New linked state (TRUE or FALSE)"	""
    )
  )
)

;Function #22
(define (gal-item-set-name input_item input_string)
  (if (defined? 'gimp-item-set-name)
    (gimp-item-set-name input_item input_string)
    (if (= (car (gimp-drawable-is-layer input_item)) TRUE)
      (gimp-drawable-set-name input_item input_string)
      (gimp-vectors-set-name input_item input_string)
    )
  )
)

(apply script-fu-register
  (append
    (list
      "gal-item-set-name"
      "gal-item-set-name"
      (string-append
	"GIMP API independent procedure\n"
	"Set the name of the specified item/drawable or even vector.\n"
	"Returns nothing."
      )
    )
    gal-credits
    (list
    ""
    SF-DRAWABLE		"The item/drawable/vector"	0
    SF-STRING		"The new item's name"		""
    )
  )
)

;Function #23
(define (gal-item-set-tattoo input_item input_var1)
  (if (defined? 'gimp-item-set-tattoo)
    (gimp-item-set-tattoo input_item input_var1)
    (if (= (car (gimp-drawable-is-layer input_item)) TRUE)
      (gimp-drawable-set-tattoo input_item input_var1)
      (gimp-vectors-set-tattoo input_item input_var1)
    )
  )
)

(apply script-fu-register
  (append
    (list
      "gal-item-set-tattoo"
      "gal-item-set-tattoo"
      (string-append
	"GIMP API independent procedure\n"
	"This procedure sets the specified item's tattoo.\n"
	"A tattoo is a unique and permanent identifier attached\n"
	"to a item that can be used to uniquely identify a item\n"
	"within an image even between sessions.\n"
	"It has no return values."
      )
    )
    gal-credits
    (list
    ""
    SF-DRAWABLE		"The item/drawable/vector"		0
    SF-STRING		"Parasite (PARASITE TYPE)"		""
    )
  )
)

;Function #24
(define (gal-item-set-visible input_item input_var1)
  (if (defined? 'gimp-item-set-visible)
    (gimp-item-set-visible input_item input_var1)
    (if (= (car (gimp-drawable-is-visible input_item)) TRUE)
      (gimp-drawable-set-visible input_item input_var1)
      (gimp-vectors-set-visible input_item input_var1)
    )
  )
)

(apply script-fu-register
  (append
    (list
      "gal-item-set-visible"
      "gal-item-set-visible"
      (string-append
	"GIMP API independent procedure\n"
	"This procedure sets the specified item's visibility."
      )
    )
    gal-credits
    (list
    ""
    SF-DRAWABLE		"The item/drawable/vector"		0
    SF-STRING		"Parasite (PARASITE TYPE)"		""
    )
  )
)

;Function #25
(define (gal-item-to-selection 
	input_item
	input_var1
	input_var2
	input_var3
	input_var4
	input_var5
	input_var6
	)
(define legacy-list (list input_var2 input_var3 input_var4 input_var5 input_var5))
(define modern-list (list input_item input_var1))
  (if (defined? 'gimp-item-transform-2d)
    (apply "gimp-item-to-selection" modern-list))
    (apply "gimp-vectors-to-selection" (append modern-list legacy-list)
  )
)

(apply script-fu-register
  (append
    (list
      "gal-item-to-selection"
      "gal-item-to-selection"
      (string-append
	"GIMP API independent procedure\n"
	"Transforms the specified item into a selection.\n"
	"Returns nothing."
      )
    )
    gal-credits
    (list
    ""
    SF-DRAWABLE		"The item/drawable/vector"		0
    SF-ADJUSTMENT	"The item to render to the selection"	'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"Operation with current selection"	'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"Antialias selection (TRUE or FALSE)"	'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"Feather selection (TRUE or FALSE)"	'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"Feather radius x"			'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"Feather radius y"			'(1 0 1 1 1 1 0)
    )
  )
)

;Function #26
(define (gal-item-transform-2d 
	input_item
	input_var1
	input_var2
	input_var3
	input_var4
	input_var5
	input_var6
	input_var7
	input_var8
	input_var9
	input_var10
	input_var11
	input_var12
	)
(define output-return)
(define legacy-list (list input-var8 input-var9 input-var10 input-var11 input-var12))
(define modern-list (list input_item input_var1 input_var2 input_var3 input_var4 input_var5 input_var6 input_var7))
  (if (defined? 'gimp-item-transform-2d)
    (set! output-return (apply "gimp-item-transform-2d" modern-list))
    (set! output-return (apply "gimp-drawable-transform-2d" (append modern-list legacy-list)))
  )
output-return
)

(apply script-fu-register
  (append
    (list
      "gal-item-transform-2d"
      "gal-item-transform-2d"
      (string-append
	"GIMP API independent procedure\n"
	"Transform the specified item in 2d.\n"
	"Returns transformed item/drawable."
      )
    )
    gal-credits
    (list
    ""
    SF-DRAWABLE		"The item/drawable/vector"		0
    SF-ADJUSTMENT	"X coordinate"				'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"Y coordinate"				'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"Scale in x direction"			'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"Scale in y direction"			'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"The angle of rotation"			'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"X coordinate of center goes"		'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"Y coordinate of center goes" 		'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"Direction of transformation"		'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"Type of interpolation"			'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"This parameter is ignored"		'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"Maximum level for supersampling"	'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"How to clip results"			'(1 0 1 1 1 1 0)
    )
  )
)

;Function #27
(define (gal-item-transform-flip 
	input_item
	input_var1
	input_var2
	input_var3
	input_var4
	input_var5
	input_var6
	input_var7
	input_var8
	input_var9
	)
(define output-return)
(define legacy-list (list input_var5 input_var6 input_var7 input_var8 input_var9))
(define modern-list (list input_item input_var1 input_var2 input_var3 input_var4))
  (if (defined? 'gimp-item-transform-flip)
    (set! output-return (apply "gimp-item-transform-flip" modern-list))
    (set! output-return (apply "gimp-drawable-transform-flip" (append modern-list legacy-list)))
  )
output-return
)

(apply script-fu-register
  (append
    (list
      "gal-item-transform-flip"
      "gal-item-transform-flip"
      (string-append
	"GIMP API independent procedure\n"
	"Flip the specified item around a given line.\n"
	"Returns transformed item/drawable."
      )
    )
    gal-credits
    (list
    ""
    SF-DRAWABLE		"The item/drawable/vector"		0
    SF-ADJUSTMENT	"horz. coord. of one end of axis"	'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"vert. coord. of one end of axis"	'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"horz. coord. of other end of axis"	'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"vert. coord. of other end of axis"	'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"Direction of transformation"		'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"Type of interpolation"			'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"This parameter is ignored"		'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"Maximum level for supersampling"	'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"How to clip results"			'(1 0 1 1 1 1 0)
    )
  )
)

;Function #28
(define (gal-item-transform-flip-simple 
	input_item
	input_var1
	input_var2
	input_var3
	input_var4
	)
(define output-return)
(define legacy-list (list input_var4))
(define modern-list (list input_item input_var1 input_var2 input_var3))
  (if (defined? 'gimp-item-transform-flip-simple)
    (set! output-return (apply "gimp-item-transform-flip-simple" modern-list))
    (set! output-return (apply "gimp-drawable-transform-simple" (append modern-list legacy-list)))
  )
output-return
)

(apply script-fu-register
  (append
    (list
      "gal-item-transform-flip-simple"
      "gal-item-transform-flip-simple"
      (string-append
	"GIMP API independent procedure\n"
	"Flip the specified item either vertically or horizontally.\n"
	"Returns transformed item/drawable."
      )
    )
    gal-credits
    (list
    ""
    SF-DRAWABLE		"The item/drawable/vector"		0
    SF-ADJUSTMENT	"Type of flip"				'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"Whether to automatically position axis"'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"coord. of flip axis"			'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"Whether to clip results"		'(1 0 1 1 1 1 0)
    )
  )
)

;Function #29
(define (gal-item-transform-matrix 
	input_item
	input_var1
	input_var2
	input_var3
	input_var4
	input_var5
	input_var6
	input_var7
	input_var8
	input_var9
	input_var10
	input_var11
	input_var12
	input_var13
	input_var14
	)
(define output-return)
(define legacy-list (list input_var10 input_var11 input_var12 input_var13 input_var14))
(define modern-list (list input_item input_var1 input_var2 input_var3 input_var4 input_var5 input_var6 input_var7 input_var8 input_var9))
  (if (defined? 'gimp-item-transform-matrix)
    (set! output-return (apply "gimp-item-transform-matrix" modern-list))
    (set! output-return (apply "gimp-drawable-transform-matrix" (append modern-list legacy-list)))
  )
output-return
)

(apply script-fu-register
  (append
    (list
      "gal-item-transform-matrix"
      "gal-item-transform-matrix"
      (string-append
	"GIMP API independent procedure\n"
	"Transform the specified drawable in 2d, with extra parameters.\n"
	"Returns transformed item/drawable."
      )
    )
    gal-credits
    (list
    ""
    SF-DRAWABLE		"The item/drawable/vector"				0
    SF-ADJUSTMENT	"coefficient (0,0) of the transformation matrix"	'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"coefficient (0,1) of the transformation matrix"	'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"coefficient (0,2) of the transformation matrix"	'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"coefficient (1,0) of the transformation matrix"	'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"coefficient (1,1) of the transformation matrix"	'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"coefficient (1,2) of the transformation matrix"	'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"coefficient (2,0) of the transformation matrix"	'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"coefficient (2,1) of the transformation matrix"	'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"coefficient (2,2) of the transformation matrix"	'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"Direction of transformation"				'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"Type of interpolation"					'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"This parameter is ignored"				'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"Maximum level for supersampling"			'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"How to clip results"					'(1 0 1 1 1 1 0)
    )
  )
)

;Function #30
(define (gal-item-transform-rotate 
	input_item
	input_var1
	input_var2
	input_var3
	input_var4
	input_var5
	input_var6
	input_var7
	input_var8
	input_var9
	)
(define output-return)
(define legacy-list (list input_var5 input_var6 input_var7 input_var8 input_var9))
(define modern-list (list input_item input_var1 input_var2 input_var3 input_var4))
  (if (defined? 'gimp-item-transform-rotate)
    (set! output-return (apply "gimp-item-transform-rotate" modern-list))
    (set! output-return (apply "gimp-drawable-transform-rotate" (append modern-list legacy-list)))
  )
output-return
)

(apply script-fu-register
  (append
    (list
      "gal-item-transform-rotate"
      "gal-item-transform-rotate"
      (string-append
	"GIMP API independent procedure\n"
	"Rotate the specified item about given coordinates through the specified angle.\n"
	"Returns transformed item/drawable."
      )
    )
    gal-credits
    (list
    ""
    SF-DRAWABLE		"The item/drawable/vector"				0
    SF-ADJUSTMENT	"The angle of rotation (radians)"			'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"Rotate around the selection center"			'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"The hor. coordinate of the center of rotation"		'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"The vert. coordinate of the center of rotation"	'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"Direction of transformation"				'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"Type of interpolation"					'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"This parameter is ignored"				'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"Maximum level for supersampling"			'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"How to clip results"					'(1 0 1 1 1 1 0)
    )
  )
)

;Function #31
(define (gal-item-transform-scale 
	input_item
	input_var1
	input_var2
	input_var3
	input_var4
	input_var5
	input_var6
	input_var7
	input_var8
	input_var9
	)
(define output-return)
(define legacy-list (list input_var5 input_var6 input_var7 input_var8 input_var9))
(define modern-list (list input_item input_var1 input_var2 input_var3 input_var4))
  (if (defined? 'gimp-item-transform-scale)
    (set! output-return (apply "gimp-item-transform-scale" modern-list))
    (set! output-return (apply "gimp-drawable-transform-scale" (append modern-list legacy-list)))
  )
output-return
)

(apply script-fu-register
  (append
    (list
      "gal-item-transform-scale"
      "gal-item-transform-scale"
      (string-append
	"GIMP API independent procedure\n"
	"Scale the specified item.\n"
	"Returns transformed item/drawable."
      )
    )
    gal-credits
    (list
    ""
    SF-DRAWABLE		"The item/drawable/vector"		0
    SF-ADJUSTMENT	"X coord. of the upper-left corner"	'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"Y coord. of the upper-left corner"	'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"X coord. of the lower-right corner"	'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"Y coord. of the lower-right corner"	'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"Direction of transformation"		'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"Type of interpolation"			'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"This parameter is ignored"		'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"Maximum level for supersampling"	'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"How to clip results"			'(1 0 1 1 1 1 0)
    )
  )
)

;Function #32
(define (gal-item-transform-shear 
	input_item
	input_var1
	input_var2
	input_var3
	input_var4
	input_var5
	input_var6
	input_var7
	)
(define output-return)
(define legacy-list (list input_var3 input_var4 input_var5 input_var6 input_var7))
(define modern-list (list input_item input_var1 input_var2 ))
  (if (defined? 'gimp-item-transform-shear)
    (set! output-return (apply "gimp-item-transform-shear" modern-list))
    (set! output-return (apply "gimp-drawable-transform-shear" (append modern-list legacy-list)))
  )
output-return
)

(apply script-fu-register
  (append
    (list
      "gal-item-transform-shear"
      "gal-item-transform-shear"
      (string-append
	"GIMP API independent procedure\n"
	"Shear the specified item about its center by the specified magnitude.\n"
	"Returns transformed item/drawable."
      )
    )
    gal-credits
    (list
    ""
    SF-DRAWABLE		"The item/drawable/vector"		0
    SF-ADJUSTMENT	"Type of shear"				'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"The magnitude of the shear"		'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"Direction of transformation"		'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"Type of interpolation"			'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"This parameter is ignored"		'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"Maximum level for supersampling"	'(1 0 1 1 1 1 0)
    SF-ADJUSTMENT	"How to clip results"			'(1 0 1 1 1 1 0)
    )
  )
)

;Function #33
(define (gal-image-insert-channel input_image input_item input_var1)
  (if (defined? 'gimp-image-insert-channel)
    (gimp-image-insert-channel input_image input_item -1 input_var1)
    (gimp-image-add-channel input_image input_item input_var1)
  )
)

(apply script-fu-register
  (append
    (list
      "gal-image-insert-channel"
      "gal-image-insert-channel"
      (string-append
	"GIMP API independent procedure\n"
	"Add the specified channel to the image.\n"
	"Returns nothing."
      )
    )
    gal-credits
    (list
    ""
    SF-IMAGE		"The image"				0
    SF-DRAWABLE		"The channel"				0
    SF-TOGGLE		"The channel position"			FALSE
    )
  )
)

;Function #34
(define (gal-image-insert-layer input_image input_item input_var1)
  (if (defined? 'gimp-image-insert-layer)
    (gimp-image-insert-layer input_image input_item -1 input_var1)
    (gimp-image-add-layer input_image input_item input_var1)
  )
)

(apply script-fu-register
  (append
    (list
      "gal-image-insert-layer"
      "gal-image-insert-layer"
      (string-append
	"GIMP API independent procedure\n"
	"Add the specified layer to the image.\n"
	"Returns nothing."
      )
    )
    gal-credits
    (list
    ""
    SF-IMAGE		"The image"				0
    SF-DRAWABLE		"The layer"				0
    SF-TOGGLE		"The layer position"			FALSE
    )
  )
)

;Function #35
(define (gal-image-insert-vectors input_image input_item input_var1)
  (if (defined? 'gimp-image-insert-vectors)
    (gimp-image-insert-vectors input_image input_item -1 input_var1)
    (gimp-image-add-vectors input_image input_item input_var1)
  )
)

(apply script-fu-register
  (append
    (list
      "gal-image-insert-vectors"
      "gal-image-insert-vectors"
      (string-append
	"GIMP API independent procedure\n"
	"Add the specified vectors to the image.\n"
	"Returns nothing."
      )
    )
    gal-credits
    (list
    ""
    SF-IMAGE		"The image"				0
    SF-DRAWABLE		"The vectors"				0
    SF-TOGGLE		"The vectors position"			FALSE
    )
  )
)