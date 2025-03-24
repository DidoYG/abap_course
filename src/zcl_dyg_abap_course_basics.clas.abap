CLASS zcl_dyg_abap_course_basics DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_abap_course_basics.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_dyg_abap_course_basics IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.  " main method for running the code
    DATA lv_task_number VALUE 2.  " Enter a task number to run it

    " Checking the number, so that the corresponding task is run
    IF lv_task_number = 1.
      out->write( zif_abap_course_basics~hello_world( 'Deyan' ) ).

    ELSEIF lv_task_number = 2.
      DATA(lv_num1) = 2.
      DATA(lv_num2) = 3.
      DATA(lv_operator) = '*'.

      DATA(lv_result) = zif_abap_course_basics~calculator(
        iv_first_number = lv_num1
        iv_second_number = lv_num2
        iv_operator = lv_operator
      ).

      DATA lv_message TYPE string.

      " Checking for 0 division
      IF lv_num2 = 0 AND lv_operator = '/'.
        lv_message = 'Error: Division by 0 is not allowed!!!'.  " If such is found, then an error message is printed

      ELSE.
        lv_message = |{ lv_num1 } { lv_operator } { lv_num2 } = { lv_result }|.  " If not, then the whole calculation is printed

      ENDIF.

      out->write( lv_message ).

    ELSE.
      out->write( 'Task not yet implemented!' ).

    ENDIF.
  ENDMETHOD.


  METHOD zif_abap_course_basics~hello_world.  " Task 1: hello_world method implementation
    DATA lv_message TYPE string.

    lv_message = |Hello { iv_name }, your system user ID is: { sy-uname }.|.

    rv_result = lv_message.
  ENDMETHOD.


  METHOD zif_abap_course_basics~calculator.  " Task 2: calculator method implementation
    DATA lv_answer TYPE i.

    IF iv_operator = '+'.
      lv_answer = iv_first_number + iv_second_number.

    ELSEIF iv_operator = '-'.
      lv_answer = iv_first_number - iv_second_number.

    ELSEIF iv_operator = '*'.
      lv_answer = iv_first_number * iv_second_number.

    ELSEIF iv_operator = '/'.
      IF iv_second_number <> 0.  " Checking for 0 division
        lv_answer = iv_first_number / iv_second_number.

      ELSE.
        lv_answer = 0.

      ENDIF.
    ENDIF.

    rv_result = lv_answer.
  ENDMETHOD.


  METHOD zif_abap_course_basics~date_parsing.
  ENDMETHOD.


  METHOD zif_abap_course_basics~fizz_buzz.
  ENDMETHOD.


  METHOD zif_abap_course_basics~get_current_date_time.
  ENDMETHOD.


  METHOD zif_abap_course_basics~internal_tables.
  ENDMETHOD.


  METHOD zif_abap_course_basics~open_sql.
  ENDMETHOD.


  METHOD zif_abap_course_basics~scrabble_score.
  ENDMETHOD.
ENDCLASS.
