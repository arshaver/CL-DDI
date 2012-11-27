;;;
;;; inference
;;;
;;; Mock Prolog example from ANSI Common Lisp chapter 15
;;; with a few enhancements (see bottom of file)
;;;
;;; 13-Sep-2005 I. Kalet created from Graham book and added a few
;;; things
;;;  8-Feb-2007 I. Kalet copied in the cats and fish example
;;; 25-Nov-2007 I. Kalet removed hashtest - see printhash in utils
;;;

;;;---------------------------------------------------------
;;; the original Graham code
;;;---------------------------------------------------------

(defun match (x y &optional binds)
  (cond 
   ((eql x y) (values binds t))
   ((assoc x binds) (match (binding x binds) y binds))
   ((assoc y binds) (match x (binding y binds) binds))
   ((var? x) (values (cons (cons x y) binds) t))
   ((var? y) (values (cons (cons y x) binds) t))
   (t
    (when (and (consp x) (consp y))
      (multiple-value-bind (b2 yes) 
	  (match (car x) (car y) binds)
        (and yes (match (cdr x) (cdr y) b2)))))))

(defun var? (x)
  (and (symbolp x) 
       (eql (char (symbol-name x) 0) #\?)))

(defun binding (x binds)
  (let ((b (assoc x binds)))
    (if b
        (or (binding (cdr b) binds)
            (cdr b)))))

(defvar *rules* (make-hash-table))

(defmacro <- (con &optional ant)
  `(length (push (cons (cdr ',con) ',ant)
                 (gethash (car ',con) *rules*))))

(defun prove (expr &optional binds)
  (case (car expr)
    (and (prove-and (reverse (cdr expr)) binds))
    (or  (prove-or (cdr expr) binds))
    (not (prove-not (cadr expr) binds))
    (t   (prove-simple (car expr) (cdr expr) binds))))

(defun prove-simple (pred args binds)
  (mapcan #'(lambda (r)
              (multiple-value-bind (b2 yes) 
		  (match args (car r) 
			 binds)
                (when yes
                  (if (cdr r) 
                      (prove (cdr r) b2) 
		    (list b2)))))
          (mapcar #'change-vars 
                  (gethash pred *rules*))))

(defun change-vars (r)
  (sublis (mapcar #'(lambda (v) (cons v (gensym "?")))
                  (vars-in r))
          r))

(defun vars-in (expr)
  (if (atom expr)
      (if (var? expr) (list expr))
    (union (vars-in (car expr))
	   (vars-in (cdr expr)))))

(defun prove-and (clauses binds)
  (if (null clauses)
      (list binds)
    (mapcan #'(lambda (b)
		(prove (car clauses) b))
	    (prove-and (cdr clauses) binds))))

(defun prove-or (clauses binds)
  (mapcan #'(lambda (c) (prove c binds))
          clauses))

(defun prove-not (clause binds)
  (unless (prove clause binds)
    (list binds)))

(defmacro with-answer (query &body body)
  (let ((binds (gensym)))
    `(dolist (,binds (prove ',query))
       (let ,(mapcar #'(lambda (v)
                         `(,v (binding ',v ,binds)))
	      (vars-in query))
         ,@body))))

;;;---------------------------------------------------------
;;; additions by IK
;;;---------------------------------------------------------

(defmacro <-- (con &optional ant)

  "like <- but replaces the hash table entry rather than adding it"

  `(length (setf (gethash (car ',con) *rules*)
	     (list (cons (cdr ',con) ',ant)))))

;;;-------------------------------------------------

(defun assert-value (pred obj &optional val)

  "converts an object value pair to an assertion"

  (if val
      (eval `(<- (,pred ,obj ,val)))
    (eval `(<- (,pred ,obj)))))

;;;-------------------------------------------------

(defun replace-assert-value (pred obj &optional val)

  "converts an object value pair to an assertion, replacing previous
  ones for that predicate"

  (if val
      (eval `(<-- (,pred ,obj ,val)))
    (eval `(<-- (,pred ,obj)))))

;;;-------------------------------------------------
;;; Here's a way to make the connection between slot values in CLOS
;;; classes and Mock Prolog facts.
;;;-------------------------------------------------

(defun assert-slot (slot obj &optional replace)

  "deals with slots that have a single item in them"

  (if replace (replace-assert-value slot obj (funcall slot obj))
    (assert-value slot obj (funcall slot obj))))

;;;-------------------------------------------------

(defun assert-list-slot (slot obj &optional replace)

  "deals with slots that have a list of items in them"

  (dolist (item (funcall slot obj))
    (if replace (replace-assert-value slot obj item)
      (assert-value slot obj item))))

;;;-------------------------------------------------
;;; sample rules and facts
;;;-------------------------------------------------

; (<- (parent donald nancy))
; (<- (child ?x ?y) (parent ?y ?x))
; (<- (daughter ?y ?x) (and (child ?y ?x) (female ?y)))
; (<- (female nancy))

;;;-------------------------------------------------

; (<- (likes ?x ?y) (and (cat ?x) (fish ?y)))
; (<- (cat ?x) (calico ?x))
; (<- (fish ?x) (tuna ?x))
; (<- (tuna charlie))
; (<- (tuna herb))
; (<- (human ira))
; (<- (calico pudge))

;;;-------------------------------------------------
;;; End.
