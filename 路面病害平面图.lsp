;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;By aerk of FHIC 2020.4.25;;;;;;
;;运行命令是BHPM               ;;
(defun c:BHPM()
    	 (setq osmode_save(getvar "OSMODE"))
   	(setvar "OSMODE" 0)
	(setq Road_length (getreal "路线长度：")) ;输入路线长度
  	(setq p1 (strcat (rtos (+ 0 Road_length)) ",0" ))
	(command "line" "0,0" p1 "")
	(setq p2 (strcat (rtos (+ 0 Road_length)) ",-3.75" ))  
  	(command "line" "0,-3.75" p2 "")
  	(setq p3 (strcat (rtos (+ 0 Road_length)) ",-7.5" ))  
  	(command "line" "0,-7.5" p3 "")
    	(setq p4 (strcat (rtos (+ 0 Road_length)) ",-10" ))  
  	(command "line" "0,-10" p4 "")
  	(setq station_kilometer (fix (/ Road_length 1000)))
  	;循环K0至Kx，每次求的整百米装坐标，并text输出。
	(setq i 0)
  	
  	(repeat station_kilometer
		
	  	(setq j 0)
	  	(repeat 10
		  
		  	(setq station_p (strcat (rtos (+ (* i 1000) j)) ",0" ))
		  	;(command "line" station_p p4 "")桩号小短线
		  	(setq K1 (rtos i))
		  	(setq K2 (rtos j))
		  	(setq station (strcat "K" K1 "+" K2))
			(command "text" station_p "10" "-90" station)
		  	(setq j (+ j 100))
		)
	  	(setq i (+ i 1))
	)
  ;例如求的一个坐标
  ;绘制平面图
  ;绘制百米桩号
  ;绘制病害布置
  
  ;

	(command "REDRAW")
	(setvar "OSMODE" osmode_save)
)