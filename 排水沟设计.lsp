;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;By aerk of FHIC 2020.4.25;;;;;;
;;����������Psg                ;;
(defun c:PSG()
  (setq P_height (getreal "��ˮ���ڸߣ�")) ;���� gaodu
  (setq P_width (getreal "��ˮ���ڿ�")) ;���� kuandu
  (setq P_thick (getreal "��ˮ���ں�")) ;���� bihou
  (command "line" "0,0" "100,0" "")
  (setq p1 (strcat (rtos (+ 100 P_thick)) "," (rtos (+ 0 0))))
  (command "line" "100,0" p1 "")
  (setq p2 (strcat (rtos (+ 100 P_thick)) "," (rtos (- 0 P_height))))
  (command "line" p1 p2 "")
  (setq p3 (strcat (rtos (+ 100 P_thick P_width)) "," (rtos (- 0 P_height))))
  (command "line" p2 p3 "")
  (setq p4 (strcat (rtos (+ 100 P_thick P_width)) "," (rtos (- 0 0))))
  (command "line" p3 p4 "")
  (setq p5 (strcat (rtos (+ 100 P_thick P_width P_thick)) "," (rtos (- 0 0))))
  (command "line" p4 p5 "")
  (setq p6 (strcat (rtos (+ 100 P_thick P_width P_thick 200)) "," (rtos (- 0 0))))
  (command "line" p5 p6 "")
  ;���ڻ���
  (setq p7 (strcat (rtos (+ 100 0)) "," (rtos (- 0 P_height P_thick))))
  (command "line" "100,0" p7 "")
  (setq p8 (strcat (rtos (+ 100 P_thick P_width P_thick)) "," (rtos (- 0 P_height P_thick))))
  (command "line" p7 p8 "")
  (command "line" p8 p5 "")
  ;������������
  (command "text" "100,-200" "10" "" "ÿ���׹���������")

  ;�ع�������
  (setq wugongliang (+ (* P_thick P_height 2) (* P_thick (+ P_width (* 2 P_thick)))))
  (setq wugongliang (/ wugongliang 10000))
  (command "text" "100,-250" "10" "" "�ع���(m3):")
  (command "text" "200,-250" "10" "" wugongliang)
  ;������������
  (setq kaiwatf (* (+ P_height P_thick ) (+ P_width (* 2 P_thick)))) 
  (setq kaiwatf (/ kaiwatf 10000))
  (command "text" "100,-350" "10" "" "��������(m3):")
  (command "text" "200,-350" "10" "" kaiwatf)
  
)
(defun c:draw_table()
	(setq table_row (getint "������������"))
	(setq table_row_height (getint "�������иߣ�"))
	(setq table_col (getint "������������"))
	(setq table_col_width (getint "�������п�"))
	(setq table_cor (getpoint "ѡȡ���Ʊ�����Ͻ�:"))
	(setq p1 table_cor)
	(setq x (car p1))
	(setq y (cadr p1))
	(setq p2 
		(strcat (rtos (+ x (* table_col_width table_col))) "," (rtos (- y (* table_row_height table_row))))
	)
  	(command "rectang" p1 p2)
	(setq i 0)
  	(repeat (- table_row 1)
		(setq i (+ i 1))
		(setq y1 (- y (* i table_row_height)))
		(setq p_row_1 (strcat (rtos x) "," (rtos y1)))
		(setq p_row_2 (strcat (rtos (+ x (* table_col_width table_col))) "," (rtos y1)))
	  	(command "line" p_row_1 p_row_2 "")
	)
	(setq i 0)
	(setq y1 (- y (* table_row_height table_row)))
	(repeat (- table_col 1)
		(setq i (+ i 1))
		(setq x1 (+ x (* i table_col_width)))
		(setq p_col_1 (strcat (rtos x1) "," (rtos y)))
		(setq p_col_2 (strcat (rtos x1) "," (rtos y1)))
	  	(command "line" p_col_1 p_col_2 "")
	)
	
)




