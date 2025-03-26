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
    DATA lv_task_number VALUE 6.  " Enter a task number to run it

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

    ELSEIF lv_task_number = 3.
      out->write( zif_abap_course_basics~fizz_buzz( ) ).

    ELSEIF lv_task_number = 4.
      out->write( zif_abap_course_basics~date_parsing( '26 March 2025' ) ).

    ELSEIF lv_task_number = 5.
      DATA: lv_word TYPE string VALUE 'ABCD',
            lv_score TYPE i.

     lv_score = zif_abap_course_basics~scrabble_score( lv_word ).

     out->write( |The word "{ lv_word }" gives a score: { lv_score }| ).

    ELSEIF lv_task_number = 6.
      DATA: lv_ts_str TYPE string,
            lv_date_str TYPE string,
            lv_time_str TYPE string.

      lv_ts_str = zif_abap_course_basics~get_current_date_time(  ).
      lv_date_str = |Date: { lv_ts_str(4) }-{ lv_ts_str+4(2) }-{ lv_ts_str+6(2) }|.
      lv_time_str = |Time: { lv_ts_str+8(2) }:{ lv_ts_str+10(2) }:{ lv_ts_str+12(2) } UTC|.

      out->write( |Unformatted ->  { lv_ts_str }| ).
      out->write( | | ).
      out->write( |Formatted   ->  { lv_date_str }| ).
      out->write( |                { lv_time_str }| ).

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


  METHOD zif_abap_course_basics~fizz_buzz.  " Task 3: fizz_buzz method implementation
    DATA lv_message TYPE string VALUE ''.
    DATA lv_index TYPE i VALUE 1.

    WHILE lv_index <= 100.
      IF ( lv_index MOD 3 = 0 ) AND ( lv_index MOD 5 = 0 ).
        lv_message = lv_message && | FizzBuzz |.

      ELSEIF ( lv_index MOD 3 = 0 ).
        lv_message = lv_message && | Fizz |.

      ELSEIF ( lv_index MOD 5 = 0 ).
        lv_message = lv_message && | Buzz |.

      ELSE.
        lv_message = lv_message && | { lv_index } |.

      ENDIF.

      lv_index += 1.

    ENDWHILE.

    rv_result = lv_message.
  ENDMETHOD.


  METHOD zif_abap_course_basics~date_parsing.  " Task 4: date_parsing method implementation
    DATA: lv_day TYPE string,
          lv_month TYPE string,
          lv_year TYPE string,
          lv_extracted_data TYPE string,
          lv_char TYPE char1,
          lv_index TYPE i,
          lv_num_of_spaces TYPE i.

    WHILE lv_index < STRLEN( iv_date ).
      lv_char = iv_date+lv_index(1).

      IF lv_char <> ' '.
        lv_extracted_data = lv_extracted_data && lv_char.

      ELSE.
        IF lv_num_of_spaces = 0.
          lv_day = lv_extracted_data.

        ELSE.
          lv_extracted_data = TO_UPPER( lv_extracted_data ).

          CASE lv_extracted_data.
            WHEN 'JANUARY'.  lv_month = '01'.
            WHEN 'FEBRUARY'. lv_month = '02'.
            WHEN 'MARCH'.    lv_month = '03'.
            WHEN 'APRIL'.    lv_month = '04'.
            WHEN 'MAY'.      lv_month = '05'.
            WHEN 'JUNE'.     lv_month = '06'.
            WHEN 'JULY'.     lv_month = '07'.
            WHEN 'AUGUST'.   lv_month = '08'.
            WHEN 'SEPTEMBER'.lv_month = '09'.
            WHEN 'OCTOBER'.  lv_month = '10'.
            WHEN 'NOVEMBER'. lv_month = '11'.
            WHEN 'DECEMBER'. lv_month = '12'.
            WHEN OTHERS.     lv_month = lv_extracted_data.
          ENDCASE.
        ENDIF.

        lv_extracted_data = ''.
        lv_num_of_spaces += 1.

      ENDIF.

      lv_index += 1.

    ENDWHILE.

    lv_year = lv_extracted_data.
    rv_result = lv_year && lv_month && lv_day.

  ENDMETHOD.


  METHOD zif_abap_course_basics~scrabble_score.  " Task 5: scrabble_score method implementation
    DATA: lv_result TYPE i,
          lv_index TYPE i,
          lv_char TYPE char1,
          lv_word TYPE string,
          lv_hex_value TYPE x.

    FIELD-SYMBOLS: <fs_ascii> TYPE x.

    lv_word = TO_UPPER( iv_word ).

    WHILE lv_index < STRLEN( lv_word ).
      lv_char = lv_word+lv_index(1).

      ASSIGN lv_char TO <fs_ascii> CASTING.  " Casting char to hex value
      lv_hex_value = <fs_ascii>.

      lv_hex_value -= 64.  " By subtracting with a decimal the hex converts to a decimal

      " Checking the letter positions form A to Z
      IF lv_hex_value >= 1 AND lv_hex_value <= 26.
        lv_result += lv_hex_value.

      ENDIF.

      lv_index += 1.

    ENDWHILE.

    rv_result = lv_result.
  ENDMETHOD.


  METHOD zif_abap_course_basics~get_current_date_time.  " Task 6: get_current_date_time method implementation
    GET TIME STAMP FIELD DATA(lv_timestamp).
    rv_result = lv_timestamp.
  ENDMETHOD.


  METHOD zif_abap_course_basics~internal_tables.
  ENDMETHOD.


  METHOD zif_abap_course_basics~open_sql.
  ENDMETHOD.
ENDCLASS.
