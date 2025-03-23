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
    DATA lv_task_number VALUE 1.  " Enter a task number to run it

    " Checking the number, so that the corresponding task is run
    IF lv_task_number = 1.
      out->write( zif_abap_course_basics~hello_world( 'Deyan' ) ).

    ELSE.
      out->write( 'Task not yet implemented!' ).

    ENDIF.
  ENDMETHOD.


  METHOD zif_abap_course_basics~hello_world.  " Task 1: hello_world method implementation
    DATA lv_message TYPE string.

    lv_message = |Hello { iv_name }, your system user ID is: { sy-uname }.|.

    rv_result = lv_message.
  ENDMETHOD.


  METHOD zif_abap_course_basics~calculator.
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
