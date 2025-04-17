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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"                              Main Method                           "

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  METHOD if_oo_adt_classrun~main.

    DATA(lv_task_number) = 8.  " Enter a number to run corresponding task

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

*                              Method 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    IF lv_task_number = 1.
      out->write( zif_abap_course_basics~hello_world( 'Deyan' ) ).



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

*                              Method 2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

*                              Method 3

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    ELSEIF lv_task_number = 3.
      out->write( zif_abap_course_basics~fizz_buzz( ) ).



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

*                              Method 4

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    ELSEIF lv_task_number = 4.
      out->write( zif_abap_course_basics~date_parsing( '26 March 2025' ) ).



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

*                              Method 5

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    ELSEIF lv_task_number = 5.
      DATA: lv_word TYPE string VALUE 'ABCD',
            lv_score TYPE i.

     lv_score = zif_abap_course_basics~scrabble_score( lv_word ).

     out->write( |The word "{ lv_word }" gives a score: { lv_score }| ).



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

*                              Method 6

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

*                              Method 7

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    ELSEIF lv_task_number = 7.
      DATA: lt_task7_1 TYPE zif_abap_course_basics~ltty_travel_id,
            lt_task7_2 TYPE zif_abap_course_basics~ltty_travel_id,
            lt_task7_3 TYPE zif_abap_course_basics~ltty_travel_id.

      zif_abap_course_basics~internal_tables(
        IMPORTING
          et_travel_ids_task7_1 = lt_task7_1
          et_travel_ids_task7_2 = lt_task7_2
          et_travel_ids_task7_3 = lt_task7_3
      ).

      out->write( 'Filter 1: "agency_id = 070001" & "booking_fee = 20" & "currency_code = JPY"' ).
      out->write( lt_task7_1 ).
      out->write( | | ).
      out->write( 'Filter 2: "total_price > 2000" & "currency_code = USD"' ).
      out->write( lt_task7_2 ).
      out->write( | | ).
      out->write( 'Filter 3: Top 10 rows' ).
      out->write( lt_task7_3 ).



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

*                              Method 8

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    ELSEIF lv_task_number = 8.
      DATA: lt_task8_1 TYPE zif_abap_course_basics~ltty_travel_id,
            lt_task8_2 TYPE zif_abap_course_basics~ltty_travel_id,
            lt_task8_3 TYPE zif_abap_course_basics~ltty_travel_id.

      zif_abap_course_basics~open_sql(
        IMPORTING
          et_travel_ids_task8_1 = lt_task8_1
          et_travel_ids_task8_2 = lt_task8_2
          et_travel_ids_task8_3 = lt_task8_3
      ).

      out->write( 'Filter 1: "agency_id = 070001" & "booking_fee = 20" & "currency_code = JPY"' ).
      out->write( lt_task8_1 ).
      out->write( | | ).
      out->write( 'Filter 2: "total_price > 2000" & "currency_code = USD"' ).
      out->write( lt_task8_2 ).
      out->write( | | ).
      out->write( 'Filter 3: Top 10 rows' ).
      out->write( lt_task8_3 ).

    ENDIF.
  ENDMETHOD.



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"           Task 1: hello_world method implementation                "

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  METHOD zif_abap_course_basics~hello_world.
    DATA lv_message TYPE string.

    lv_message = |Hello { iv_name }, your system user ID is: { sy-uname }.|.

    rv_result = lv_message.
  ENDMETHOD.



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"           Task 2: calculator method implementation                 "

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  METHOD zif_abap_course_basics~calculator.
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



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"           Task 3: fizz_buzz method implementation                  "

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  METHOD zif_abap_course_basics~fizz_buzz.
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



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"           Task 4: date_parsing method implementation               "

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  METHOD zif_abap_course_basics~date_parsing.
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



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"           Task 5: scrabble_score method implementation             "

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  METHOD zif_abap_course_basics~scrabble_score.
    DATA: lv_result TYPE i,
          lv_index TYPE i,
          lv_char TYPE char1,
          lv_word TYPE string,
          lv_hex_value TYPE x.

    FIELD-SYMBOLS <fs_ascii> TYPE x.

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



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"        Task 6: get_current_date_time method implementation         "

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  METHOD zif_abap_course_basics~get_current_date_time.
    GET TIME STAMP FIELD DATA(lv_timestamp).
    rv_result = lv_timestamp.
  ENDMETHOD.



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"           Task 7: internal_tables method implementation            "

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  METHOD zif_abap_course_basics~internal_tables.
    DATA lt_ztravel_table TYPE STANDARD TABLE OF ZTRAVEL_DYG.

    SELECT COUNT(*) FROM ZTRAVEL_DYG INTO @DATA(lv_count).

    " 1: Populating the table 'ZTRAVEL_DYG' if empty.
    IF lv_count = 0.
      SELECT * FROM ZTRAVEL_DYG INTO TABLE @lt_ztravel_table.
      DELETE ZTRAVEL_DYG FROM TABLE @lt_ztravel_table.
      COMMIT WORK AND WAIT.
      INSERT ZTRAVEL_DYG FROM (
        SELECT FROM /dmo/travel
        FIELDS uuid( )          AS travel_uuid,
               travel_id        AS travel_id,
               agency_id        AS agency_id,
               customer_id      AS customer_id,
               begin_date       AS begin_date,
               end_date         AS end_date,
               booking_fee      AS booking_fee,
               total_price      AS total_price,
               currency_code    AS currency_code,
               description      AS description,
               CASE status
                 WHEN 'B' THEN  'A'  " ACCEPTED
                 WHEN 'X'  THEN 'X'  " CANCELLED
                 ELSE 'O'            " open
               END              AS overall_status,
               createdby        AS createdby,
               createdat        AS createdat,
               lastchangedby    AS last_changed_by,
               lastchangedat    AS last_changed_at
        ORDER BY travel_id
      ).
      COMMIT WORK AND WAIT.
    ENDIF.

    CLEAR lt_ztravel_table.

    " 2: Reading the contents of the 'ZTRAVEL_DYG' table.
    SELECT * FROM ZTRAVEL_DYG INTO TABLE @lt_ztravel_table.

    " No SQL used
    " 3: Exporting table 'et_travel_ids_task7_1' with the required information.
    LOOP AT lt_ztravel_table INTO DATA(lv_data_1).
      IF lv_data_1-agency_id = '070001' AND lv_data_1-booking_fee = 20 AND lv_data_1-currency_code = 'JPY'.
        APPEND VALUE #( travel_id = lv_data_1-travel_id ) TO et_travel_ids_task7_1.
      ENDIF.
    ENDLOOP.

    " 4: Exporting table 'et_travel_ids_task7_2' with the required information.
    LOOP AT lt_ztravel_table INTO DATA(lv_data_2).
      IF lv_data_2-total_price > 2000 AND lv_data_2-currency_code = 'USD'.
        APPEND VALUE #( travel_id = lv_data_2-travel_id ) TO et_travel_ids_task7_2.
      ENDIF.
    ENDLOOP.

    " 5: Deleting entries that are not in EURO.
    DELETE lt_ztravel_table WHERE currency_code <> 'EUR'.

    " Sorting the entries by cheapest price and earliest date.
    SORT lt_ztravel_table BY total_price ASCENDING begin_date ASCENDING.

    " 6: Exporting table 'et_travel_ids_task7_3' containing the first 10 rows of the sorted table 'lt_ztravel_table'.
    DATA(lv_cycles) = 10.

    " Adjusting the numbers of cycles, based on the numbers of rows in the table 'lt_ztravel_table'.
    IF LINES( lt_ztravel_table ) < 10.
      lv_cycles = LINES( lt_ztravel_table ).
    ENDIF.

    DO lv_cycles TIMES.
      APPEND VALUE #( travel_id = lt_ztravel_table[ sy-index ]-travel_id ) TO et_travel_ids_task7_3.
    ENDDO.
  ENDMETHOD.



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"              Task 8: open_sql method implementation                "

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  METHOD zif_abap_course_basics~open_sql.
    " 1: Exporting table 'et_travel_ids_task8_1' with the required information.
    SELECT travel_id
    FROM ZTRAVEL_DYG
    WHERE agency_id = '070001' AND booking_fee = 20 AND currency_code = 'JPY'
    INTO TABLE @et_travel_ids_task8_1.

    " 2: Exporting table 'et_travel_ids_task8_2' with the required information.
    SELECT travel_id
    FROM ZTRAVEL_DYG
    WHERE total_price > 2000 AND currency_code = 'USD'
    INTO TABLE @et_travel_ids_task8_2.

    " 3: Exporting table 'et_travel_ids_task8_3' containing the first 10 rows.
    SELECT travel_id
    FROM ZTRAVEL_DYG
    WHERE currency_code = 'EUR'
    ORDER BY total_price ASCENDING, begin_date ASCENDING
    INTO TABLE @et_travel_ids_task8_3
    UP TO 10 ROWS.

  ENDMETHOD.
ENDCLASS.
