write 0b0000000000111111 ram.0
write 0b0000000000111111 ram.1
write 0b0000000000000000 ram.2
write 0b0000000000000010 ram.3
write 0b0000000000000000 ram.4
write 0b0000000000000000 ram.5
write 7 ram.6
write 7 ram.7
write 56 ram.8
write 72 ram.9
write 56 ram.10
write 72 ram.11
write 0 ram.12
write 0 ram.13
write 0 ram.14
write 0 ram.15
write 0 ram.16
write 0 ram.17
write 2 ram.18
write 5 ram.19
write 0 ram.20
write 0 ram.21
write str_1 ram+.0
write 3 ram+.1
write 1 ram+.2
call func_sys.print_string_y
write str_2 ram+.0
write 2 ram+.1
write 3 ram+.2
call func_sys.print_string_y
write str_3 ram+.0
write 2 ram+.1
write 4 ram+.2
call func_sys.print_string_y
write str_4 ram+.0
write 2 ram+.1
write 5 ram+.2
call func_sys.print_string_y
write str_5 ram+.0
write 2 ram+.1
write 7 ram+.2
call func_sys.print_string_y
write str_6 ram+.0
write 1 ram+.1
write 9 ram+.2
call func_sys.print_string_y
write str_7 ram+.0
write 0 ram+.1
write 12 ram+.2
call func_sys.print_string_y
write str_8 ram+.0
write 1 ram+.1
write 14 ram+.2
call func_sys.print_string_y
call func_get_key
write [ram+.0] ram.21
write 1 ram.22
write [ram.22] ctl.cnd
goto? while_2_end
while_2_start:
  write [ram.21] alu.1
  write 0x16 alu.2
  write [alu.=] ctl.cnd
  goto? if_9_1
    write 0 ram.18
    write 0 ram.22
  goto if_9_end
  if_9_1:
  write [ram.21] alu.1
  write 0x1e alu.2
  write [alu.=] ctl.cnd
  goto? if_9_2
    write 1 ram.18
    write 0 ram.22
  goto if_9_end
  if_9_2:
  write [ram.21] alu.1
  write 0x26 alu.2
  write [alu.=] ctl.cnd
  goto? if_9_3
    write 2 ram.18
    write 0 ram.19
    write 0 ram.22
  goto if_9_end
  if_9_3:
    call func_get_key
    write [ram+.0] ram.21
  if_9_end:
write [ram.22] ctl.cnd
goto? while_2_end
goto while_2_start
while_2_end:
call func_sys.vram.clear
write [ram.6] ram+.0
write 40 ram+.1
call func_draw_paddle_addr
write [ram.7] ram+.0
write 976 ram+.1
call func_draw_paddle_addr
write 0 ram+.0
write 0 ram+.1
write 6 ram+.2
call func_sys.print_int_y
write 0 ram+.0
write 0 ram+.1
write 9 ram+.2
call func_sys.print_int_y
write 1 ctl.cnd
goto? while_7_end
while_7_start:
  write [ram.20] alu.1
  write 1 alu.2
  write [alu.+] ram.20
  write [ram.20] alu.1
  write [ram.19] alu.2
  write [alu.>] ctl.cnd
  goto? if_14_end
    write [ram.0] ram.4
    write [ram.1] ram.5
    write [ram.0] alu.1
    write 0b0000000001111111 alu.2
    write [alu.-] ram.23
    write [ram.23] alu.1
    write 1 alu.2
    write [alu.-] ram.23
    write [ram.23] alu.1
    write 0b1000000000000000 alu.2
    write [alu.<] ctl.cnd
    goto? if_15_end
      write 0b0000000000000000 alu.1
      write [ram.2] alu.2
      write [alu.-] ram.2
    if_15_end:
    write [ram.0] alu.1
    write 0b0000000000000001 alu.2
    write [alu.-] ram.23
    write [ram.23] alu.1
    write 1 alu.2
    write [alu.+] ram.23
    write [ram.23] alu.1
    write 0b0111111111111111 alu.2
    write [alu.>] ctl.cnd
    goto? if_16_end
      write 0b0000000000000000 alu.1
      write [ram.2] alu.2
      write [alu.-] ram.2
    if_16_end:
    write [ram.1] alu.1
    write 0b0000000001111111 alu.2
    write [alu.-] ram.23
    write [ram.23] alu.1
    write 1 alu.2
    write [alu.-] ram.23
    write [ram.23] alu.1
    write 0b1000000000000000 alu.2
    write [alu.<] ctl.cnd
    goto? if_17_end
      write [ram.12] alu.1
      write 1 alu.2
      write [alu.+] ram.12
      write [ram.12] ram+.0
      write 0 ram+.1
      write 6 ram+.2
      call func_sys.print_int_y
      write 0b0000000000111111 ram.0
      write 0b0000000000010100 ram.1
      write 0b0000000000000000 ram.2
      write 0b0000000000000010 ram.3
    if_17_end:
    write [ram.1] alu.1
    write 0b0000000000000001 alu.2
    write [alu.-] ram.23
    write [ram.23] alu.1
    write 1 alu.2
    write [alu.+] ram.23
    write [ram.23] alu.1
    write 0b0111111111111111 alu.2
    write [alu.>] ctl.cnd
    goto? if_18_end
      write [ram.13] alu.1
      write 1 alu.2
      write [alu.+] ram.13
      write [ram.13] ram+.0
      write 0 ram+.1
      write 9 ram+.2
      call func_sys.print_int_y
      write 0b0000000000111111 ram.0
      write 0b0000000001101011 ram.1
      write 0b0000000000000000 ram.2
      write 0b1111111111111110 ram.3
    if_18_end:
    write [ram.1] alu.1
    write 0b0000000000000111 alu.2
    write [alu.-] ram.23
    write [ram.23] alu.1
    write 1 alu.2
    write [alu.+] ram.23
    write [ram.23] alu.1
    write 0b0111111111111111 alu.2
    write [alu.>] ctl.cnd
    goto? if_19_end
      write [ram.0] alu.1
      write [ram.8] alu.2
      write [alu.-] ram.23
      write [ram.23] alu.1
      write 1 alu.2
      write [alu.-] ram.23
      write [ram.23] alu.1
      write 0b1000000000000000 alu.2
      write [alu.<] ctl.cnd
      goto? if_20_end
        write [ram.0] alu.1
        write [ram.9] alu.2
        write [alu.-] ram.23
        write [ram.23] alu.1
        write 1 alu.2
        write [alu.+] ram.23
        write [ram.23] alu.1
        write 0b0111111111111111 alu.2
        write [alu.>] ctl.cnd
        goto? if_21_end
          write 0b0000000000000000 alu.1
          write [ram.3] alu.2
          write [alu.-] ram.3
          write [ram.2] alu.1
          write 0b0000000000000001 alu.2
          write [alu.+] ram.2
        if_21_end:
      if_20_end:
    if_19_end:
    write [ram.1] alu.1
    write 0b0000000001111000 alu.2
    write [alu.-] ram.23
    write [ram.23] alu.1
    write 1 alu.2
    write [alu.-] ram.23
    write [ram.23] alu.1
    write 0b1000000000000000 alu.2
    write [alu.<] ctl.cnd
    goto? if_22_end
      write [ram.0] alu.1
      write [ram.10] alu.2
      write [alu.-] ram.23
      write [ram.23] alu.1
      write 1 alu.2
      write [alu.-] ram.23
      write [ram.23] alu.1
      write 0b1000000000000000 alu.2
      write [alu.<] ctl.cnd
      goto? if_23_end
        write [ram.0] alu.1
        write [ram.11] alu.2
        write [alu.-] ram.23
        write [ram.23] alu.1
        write 1 alu.2
        write [alu.+] ram.23
        write [ram.23] alu.1
        write 0b0111111111111111 alu.2
        write [alu.>] ctl.cnd
        goto? if_24_end
          write 0b0000000000000000 alu.1
          write [ram.3] alu.2
          write [alu.-] ram.3
          write [ram.2] alu.1
          write 0b0000000000000001 alu.2
          write [alu.+] ram.2
        if_24_end:
      if_23_end:
    if_22_end:
    write [ram.0] alu.1
    write [ram.2] alu.2
    write [alu.+] ram.0
    write [ram.1] alu.1
    write [ram.3] alu.2
    write [alu.+] ram.1
    write [ram.0] ram+.0
    write [ram.1] ram+.1
    write [ram.4] ram+.2
    write [ram.5] ram+.3
    call func_draw_ball_old_y
    write 0x000f vram.512
    write 0xf00f vram.513
    write 0xf00f vram.514
    write 0xf00f vram.515
    write 0xf00f vram.516
    write 0xf00f vram.517
    write 0xf00f vram.518
    write 0xf000 vram.519
    write 0 ram.20
  if_14_end:
  call func_get_key
  write [ram+.0] ram.21
  write [ram.18] alu.1
  write 0 alu.2
  write [alu.=] ctl.cnd
  goto? if_25_1
    // two player mode
    write [ram.21] alu.1
    write 0x23 alu.2
    write [alu.=] ctl.cnd
    goto? if_26_1
      write 1 ram.15
    goto if_26_end
    if_26_1:
    write [ram.21] alu.1
    write 0x1c alu.2
    write [alu.=] ctl.cnd
    goto? if_26_2
      write 1 ram.14
    goto if_26_end
    if_26_2:
    write [ram.21] alu.1
    write 0x3b alu.2
    write [alu.=] ctl.cnd
    goto? if_26_3
      write 1 ram.16
    goto if_26_end
    if_26_3:
    write [ram.21] alu.1
    write 0x4b alu.2
    write [alu.=] ctl.cnd
    goto? if_26_end
      write 1 ram.17
    goto if_26_end
    if_26_end:
  goto if_25_end
  if_25_1:
  write [ram.18] alu.1
  write 1 alu.2
  write [alu.=] ctl.cnd
  goto? if_25_2
    write [ram.21] alu.1
    write 0x23 alu.2
    write [alu.=] ctl.cnd
    goto? if_27_1
      write 1 ram.15
    goto if_27_end
    if_27_1:
    write [ram.21] alu.1
    write 0x1c alu.2
    write [alu.=] ctl.cnd
    goto? if_27_end
      write 1 ram.14
    goto if_27_end
    if_27_end:
    write [ram.1] alu.1
    write 0b0000000000101011 alu.2
    write [alu.-] ram.23
    write [ram.23] alu.1
    write 1 alu.2
    write [alu.-] ram.23
    write [ram.23] alu.1
    write 0b1000000000000000 alu.2
    write [alu.<] ctl.cnd
    goto? if_28_end
      write [ram.0] alu.1
      write [ram.10] alu.2
      write [alu.-] ram.23
      write [ram.23] alu.1
      write 0b0111111111111111 alu.2
      write [alu.>] ctl.cnd
      goto? if_29_end
        write 1 ram.16
      if_29_end:
      write [ram.0] alu.1
      write [ram.11] alu.2
      write [alu.-] ram.23
      write [ram.23] alu.1
      write 0b1000000000000000 alu.2
      write [alu.<] ctl.cnd
      goto? if_30_end
        write 1 ram.17
      if_30_end:
    if_28_end:
  goto if_25_end
  if_25_2:
    write [ram.1] alu.1
    write 0b0000000001010011 alu.2
    write [alu.-] ram.23
    write [ram.23] alu.1
    write 1 alu.2
    write [alu.+] ram.23
    write [ram.23] alu.1
    write 0b0111111111111111 alu.2
    write [alu.>] ctl.cnd
    goto? if_31_end
      write [ram.0] alu.1
      write [ram.9] alu.2
      write [alu.-] ram.23
      write [ram.23] alu.1
      write 0b1000000000000000 alu.2
      write [alu.<] ctl.cnd
      goto? if_32_end
        write 1 ram.15
      if_32_end:
      write [ram.0] alu.1
      write [ram.8] alu.2
      write [alu.-] ram.23
      write [ram.23] alu.1
      write 0b0111111111111111 alu.2
      write [alu.>] ctl.cnd
      goto? if_33_end
        write 1 ram.14
      if_33_end:
    if_31_end:
    write [ram.1] alu.1
    write 0b0000000000101011 alu.2
    write [alu.-] ram.23
    write [ram.23] alu.1
    write 1 alu.2
    write [alu.-] ram.23
    write [ram.23] alu.1
    write 0b1000000000000000 alu.2
    write [alu.<] ctl.cnd
    goto? if_34_end
      write [ram.0] alu.1
      write [ram.10] alu.2
      write [alu.-] ram.23
      write [ram.23] alu.1
      write 0b0111111111111111 alu.2
      write [alu.>] ctl.cnd
      goto? if_35_end
        write 1 ram.16
      if_35_end:
      write [ram.0] alu.1
      write [ram.11] alu.2
      write [alu.-] ram.23
      write [ram.23] alu.1
      write 0b1000000000000000 alu.2
      write [alu.<] ctl.cnd
      goto? if_36_end
        write 1 ram.17
      if_36_end:
    if_34_end:
  if_25_end:
  write [ram.15] ctl.cnd
  goto? if_37_end
    write 0 ram.15
    write [ram.6] alu.1
    write 14 alu.2
    write [alu.<] ctl.cnd
    goto? if_38_end
      write [ram.6] ram+.0
      write 40 ram+.1
      write 1 ram+.2
      call func_draw_paddle_erase
      write [ram.6] alu.1
      write 1 alu.2
      write [alu.+] ram.6
      write [ram.6] ram+.0
      write 40 ram+.1
      call func_draw_paddle_addr
      write [ram.8] alu.1
      write 8 alu.2
      write [alu.+] ram.8
      write [ram.9] alu.1
      write 8 alu.2
      write [alu.+] ram.9
    if_38_end:
  if_37_end:
  write [ram.14] ctl.cnd
  goto? if_39_end
    write 0 ram.14
    write [ram.6] alu.1
    write 0 alu.2
    write [alu.>] ctl.cnd
    goto? if_40_end
      write [ram.6] ram+.0
      write 40 ram+.1
      write 1 ram+.2
      call func_draw_paddle_erase
      write [ram.6] alu.1
      write 1 alu.2
      write [alu.-] ram.6
      write [ram.6] ram+.0
      write 40 ram+.1
      call func_draw_paddle_addr
      write [ram.8] alu.1
      write 8 alu.2
      write [alu.-] ram.8
      write [ram.9] alu.1
      write 8 alu.2
      write [alu.-] ram.9
    if_40_end:
  if_39_end:
  write [ram.16] ctl.cnd
  goto? if_41_end
    write 0 ram.16
    write [ram.7] alu.1
    write 0 alu.2
    write [alu.>] ctl.cnd
    goto? if_42_end
      write [ram.7] ram+.0
      write 976 ram+.1
      write 1 ram+.2
      call func_draw_paddle_erase
      write [ram.7] alu.1
      write 1 alu.2
      write [alu.-] ram.7
      write [ram.7] ram+.0
      write 976 ram+.1
      call func_draw_paddle_addr
      write [ram.10] alu.1
      write 8 alu.2
      write [alu.-] ram.10
      write [ram.11] alu.1
      write 8 alu.2
      write [alu.-] ram.11
    if_42_end:
  if_41_end:
  write [ram.17] ctl.cnd
  goto? if_43_end
    write 0 ram.17
    write [ram.7] alu.1
    write 14 alu.2
    write [alu.<] ctl.cnd
    goto? if_44_end
      write [ram.7] ram+.0
      write 976 ram+.1
      write 1 ram+.2
      call func_draw_paddle_erase
      write [ram.7] alu.1
      write 1 alu.2
      write [alu.+] ram.7
      write [ram.7] ram+.0
      write 976 ram+.1
      call func_draw_paddle_addr
      write [ram.10] alu.1
      write 8 alu.2
      write [alu.+] ram.10
      write [ram.11] alu.1
      write 8 alu.2
      write [alu.+] ram.11
    if_44_end:
  if_43_end:
write 1 ctl.cnd
goto? while_7_end
goto while_7_start
while_7_end:
stop
sys.vram.shifted_pixels:
0b1000000000000000
0b0100000000000000
0b0010000000000000
0b0001000000000000
0b0000100000000000
0b0000010000000000
0b0000001000000000
0b0000000100000000
0b0000000010000000
0b0000000001000000
0b0000000000100000
0b0000000000010000
0b0000000000001000
0b0000000000000100
0b0000000000000010
0b0000000000000001
str_0:
0
sys.vram.glyphs:
0b0000000000000000
0b0000000000000000
0b0000000000000000
0b0000000000000000
0b0000000000000000
0b0000000000000000
0b0100000001000000
0b0100000001000000
0b0100000001000000
0b0100000001000000
0b0000000000000000
0b0100000001000000
0b0101000001010000
0b0101000001010000
0b0000000000000000
0b0000000000000000
0b0000000000000000
0b0000000000000000
0b0010100000101000
0b0111110001111100
0b0010100000101000
0b0111110001111100
0b0010100000101000
0b0000000000000000
0b0001000000010000
0b0011110000111100
0b0101000001010000
0b0011100000111000
0b0001010000010100
0b0111100001111000
0b0110001001100010
0b0110010001100100
0b0000100000001000
0b0001000000010000
0b0010011000100110
0b0100011001000110
0b0011000000110000
0b0100100001001000
0b0011000000110000
0b0101100001011000
0b0100100001001000
0b0011010000110100
0b0100000001000000
0b0100000001000000
0b0000000000000000
0b0000000000000000
0b0000000000000000
0b0000000000000000
0b0001000000010000
0b0010000000100000
0b0100000001000000
0b0100000001000000
0b0010000000100000
0b0001000000010000
0b0001000000010000
0b0000100000001000
0b0000010000000100
0b0000010000000100
0b0000100000001000
0b0001000000010000
0b0101010001010100
0b0011100000111000
0b0110110001101100
0b0011100000111000
0b0101010001010100
0b0000000000000000
0b0001000000010000
0b0001000000010000
0b0111110001111100
0b0001000000010000
0b0001000000010000
0b0000000000000000
0b0000000000000000
0b0000000000000000
0b0000000000000000
0b0110000001100000
0b0010000000100000
0b0100000001000000
0b0000000000000000
0b0000000000000000
0b0111110001111100
0b0000000000000000
0b0000000000000000
0b0000000000000000
0b0000000000000000
0b0000000000000000
0b0000000000000000
0b0000000000000000
0b0000000000000000
0b0100000001000000
0b0001000000010000
0b0001000000010000
0b0010000000100000
0b0010000000100000
0b0100000001000000
0b0100000001000000
0b0011100000111000
0b0100010001000100
0b0100110001001100
0b0101010001010100
0b0110010001100100
0b0011100000111000
0b0000100000001000
0b0001100000011000
0b0000100000001000
0b0000100000001000
0b0000100000001000
0b0001110000011100
0b0011100000111000
0b0000010000000100
0b0000010000000100
0b0001100000011000
0b0010000000100000
0b0011110000111100
0b0011100000111000
0b0000010000000100
0b0001100000011000
0b0000010000000100
0b0000010000000100
0b0011100000111000
0b0001100000011000
0b0010100000101000
0b0100100001001000
0b0011110000111100
0b0000100000001000
0b0000100000001000
0b0011110000111100
0b0010000000100000
0b0001100000011000
0b0000010000000100
0b0010010000100100
0b0001100000011000
0b0001100000011000
0b0010000000100000
0b0011100000111000
0b0010010000100100
0b0010010000100100
0b0001100000011000
0b0111100001111000
0b0000100000001000
0b0001110000011100
0b0000100000001000
0b0000100000001000
0b0000100000001000
0b0001100000011000
0b0010010000100100
0b0001100000011000
0b0010010000100100
0b0010010000100100
0b0001100000011000
0b0001100000011000
0b0010010000100100
0b0010010000100100
0b0001110000011100
0b0000010000000100
0b0001100000011000
0b0001000000010000
0b0001000000010000
0b0000000000000000
0b0001000000010000
0b0001000000010000
0b0000000000000000
0b0001000000010000
0b0001000000010000
0b0000000000000000
0b0001000000010000
0b0001000000010000
0b0010000000100000
0b0000000000000000
0b0001000000010000
0b0010000000100000
0b0100000001000000
0b0010000000100000
0b0001000000010000
0b0000000000000000
0b0111110001111100
0b0000000000000000
0b0111110001111100
0b0000000000000000
0b0000000000000000
0b0000000000000000
0b0100000001000000
0b0010000000100000
0b0001000000010000
0b0010000000100000
0b0100000001000000
0b0011100000111000
0b0100010001000100
0b0001100000011000
0b0001000000010000
0b0000000000000000
0b0001000000010000
0b0011110000111100
0b0100001001000010
0b0101101001011010
0b0101111001011110
0b0100000001000000
0b0011110000111100
0b0001000000010000
0b0010100000101000
0b0100010001000100
0b0111110001111100
0b0100010001000100
0b0100010001000100
0b0111100001111000
0b0100010001000100
0b0111100001111000
0b0100010001000100
0b0100010001000100
0b0111100001111000
0b0011100000111000
0b0100010001000100
0b0100000001000000
0b0100000001000000
0b0100010001000100
0b0011100000111000
0b0111100001111000
0b0100010001000100
0b0100010001000100
0b0100010001000100
0b0100010001000100
0b0111100001111000
0b0111110001111100
0b0100000001000000
0b0111100001111000
0b0100000001000000
0b0100000001000000
0b0111110001111100
0b0111110001111100
0b0100000001000000
0b0111100001111000
0b0100000001000000
0b0100000001000000
0b0100000001000000
0b0011100000111000
0b0100000001000000
0b0100000001000000
0b0101110001011100
0b0100010001000100
0b0011100000111000
0b0100010001000100
0b0100010001000100
0b0111110001111100
0b0100010001000100
0b0100010001000100
0b0100010001000100
0b0111110001111100
0b0001000000010000
0b0001000000010000
0b0001000000010000
0b0001000000010000
0b0111110001111100
0b0111110001111100
0b0001000000010000
0b0001000000010000
0b0001000000010000
0b1001000010010000
0b0110000001100000
0b0100010001000100
0b0100100001001000
0b0101000001010000
0b0111000001110000
0b0100100001001000
0b0100010001000100
0b0100000001000000
0b0100000001000000
0b0100000001000000
0b0100000001000000
0b0100000001000000
0b0111110001111100
0b0100010001000100
0b0110110001101100
0b0101010001010100
0b0101010001010100
0b0100010001000100
0b0100010001000100
0b0100010001000100
0b0110010001100100
0b0101010001010100
0b0100110001001100
0b0100010001000100
0b0100010001000100
0b0011100000111000
0b0100010001000100
0b0100010001000100
0b0100010001000100
0b0100010001000100
0b0011100000111000
0b0111100001111000
0b0100010001000100
0b0100010001000100
0b0111100001111000
0b0100000001000000
0b0100000001000000
0b0011100000111000
0b0100010001000100
0b0100010001000100
0b0101010001010100
0b0100100001001000
0b0011010000110100
0b0111100001111000
0b0100010001000100
0b0100010001000100
0b0111100001111000
0b0100100001001000
0b0100010001000100
0b0011100000111000
0b0100010001000100
0b0011000000110000
0b0000100000001000
0b0100010001000100
0b0011100000111000
0b0111110001111100
0b0001000000010000
0b0001000000010000
0b0001000000010000
0b0001000000010000
0b0001000000010000
0b0100010001000100
0b0100010001000100
0b0100010001000100
0b0100010001000100
0b0100010001000100
0b0011100000111000
0b0100010001000100
0b0100010001000100
0b0100010001000100
0b0010100000101000
0b0010100000101000
0b0001000000010000
0b0100010001000100
0b0100010001000100
0b0101010001010100
0b0101010001010100
0b0110110001101100
0b0100010001000100
0b0100010001000100
0b0010100000101000
0b0001000000010000
0b0010100000101000
0b0100010001000100
0b0100010001000100
0b0100010001000100
0b0100010001000100
0b0011100000111000
0b0001000000010000
0b0001000000010000
0b0001000000010000
0b0111110001111100
0b0000010000000100
0b0000100000001000
0b0001000000010000
0b0010000000100000
0b0111110001111100
0b0110000001100000
0b0100000001000000
0b0100000001000000
0b0100000001000000
0b0100000001000000
0b0110000001100000
0b0100000001000000
0b0100000001000000
0b0010000000100000
0b0010000000100000
0b0001000000010000
0b0001000000010000
0b0110000001100000
0b0010000000100000
0b0010000000100000
0b0010000000100000
0b0010000000100000
0b0110000001100000
0b0001000000010000
0b0010100000101000
0b0100010001000100
0b0000000000000000
0b0000000000000000
0b0000000000000000
0b0000000000000000
0b0000000000000000
0b0000000000000000
0b0000000000000000
0b0000000000000000
0b0111111001111110
0b0100000001000000
0b0010000000100000
0b0000000000000000
0b0000000000000000
0b0000000000000000
0b0000000000000000
0b0000000000000000
0b0011100000111000
0b0000010000000100
0b0011110000111100
0b0100010001000100
0b0011110000111100
0b0100000001000000
0b0101100001011000
0b0110010001100100
0b0100010001000100
0b0100010001000100
0b0111100001111000
0b0000000000000000
0b0011100000111000
0b0100000001000000
0b0100000001000000
0b0100010001000100
0b0011100000111000
0b0000010000000100
0b0011010000110100
0b0100110001001100
0b0100010001000100
0b0100010001000100
0b0011110000111100
0b0000000000000000
0b0011100000111000
0b0100010001000100
0b0111110001111100
0b0100000001000000
0b0011100000111000
0b0000011000000110
0b0000100000001000
0b0001110000011100
0b0000100000001000
0b0000100000001000
0b0000100000001000
0b0000000000000000
0b0011110000111100
0b0100010001000100
0b0011110000111100
0b0000010000000100
0b0011100000111000
0b0100000001000000
0b0100000001000000
0b0101100001011000
0b0110010001100100
0b0100010001000100
0b0100010001000100
0b0010000000100000
0b0000000000000000
0b0110000001100000
0b0010000000100000
0b0010000000100000
0b0111000001110000
0b0001000000010000
0b0000000000000000
0b0011000000110000
0b0001000000010000
0b1001000010010000
0b0110000001100000
0b0100000001000000
0b0100100001001000
0b0101000001010000
0b0110000001100000
0b0101000001010000
0b0100100001001000
0b0110000001100000
0b0010000000100000
0b0010000000100000
0b0010000000100000
0b0010000000100000
0b0111000001110000
0b0000000000000000
0b0110100001101000
0b0101010001010100
0b0101010001010100
0b0101010001010100
0b0101010001010100
0b0000000000000000
0b0101100001011000
0b0110010001100100
0b0100010001000100
0b0100010001000100
0b0100010001000100
0b0000000000000000
0b0011100000111000
0b0100010001000100
0b0100010001000100
0b0100010001000100
0b0011100000111000
0b0000000000000000
0b0111100001111000
0b0100010001000100
0b0111100001111000
0b0100000001000000
0b0100000001000000
0b0000000000000000
0b0011110000111100
0b0100010001000100
0b0011110000111100
0b0000010000000100
0b0000010000000100
0b0000000000000000
0b0101100001011000
0b0110010001100100
0b0100000001000000
0b0100000001000000
0b0100000001000000
0b0000000000000000
0b0011110000111100
0b0100000001000000
0b0011100000111000
0b0000010000000100
0b0111100001111000
0b0010000000100000
0b0111100001111000
0b0010000000100000
0b0010000000100000
0b0010010000100100
0b0001100000011000
0b0000000000000000
0b0100010001000100
0b0100010001000100
0b0100010001000100
0b0100110001001100
0b0011010000110100
0b0000000000000000
0b0100010001000100
0b0100010001000100
0b0010100000101000
0b0010100000101000
0b0001000000010000
0b0000000000000000
0b0100010001000100
0b0100010001000100
0b0101010001010100
0b0101010001010100
0b0010100000101000
0b0000000000000000
0b0110010001100100
0b0001100000011000
0b0001000000010000
0b0011000000110000
0b0100110001001100
0b0000000000000000
0b0100010001000100
0b0100010001000100
0b0011110000111100
0b0000010000000100
0b0011100000111000
0b0000000000000000
0b0111110001111100
0b0000100000001000
0b0001000000010000
0b0010000000100000
0b0111110001111100
0b0011000000110000
0b0010000000100000
0b0100000001000000
0b0100000001000000
0b0010000000100000
0b0011000000110000
0b0100000001000000
0b0100000001000000
0b0100000001000000
0b0100000001000000
0b0100000001000000
0b0100000001000000
0b0110000001100000
0b0010000000100000
0b0001000000010000
0b0001000000010000
0b0010000000100000
0b0110000001100000
0b0000000000000000
0b0010000000100000
0b0101010001010100
0b0000100000001000
0b0000000000000000
0b0000000000000000
0b0111011101110111
0b0100010101000101
0b0111011001110110
0b0100010101000101
0b0100010101000101
0b0111010101110101
0b1000000010000000
0b1000000010000000
0b1000000010000000
0b1000000010000000
0b1000000010000000
0b1000000010000000
str_1:
80
105
110
103
32
32
80
111
110
103
0
str_2:
49
32
45
32
112
49
32
118
115
32
112
50
0
str_3:
50
32
45
32
112
49
32
118
115
32
65
73
0
str_4:
51
32
45
32
65
73
32
118
115
32
65
73
0
str_5:
112
108
97
121
101
114
49
32
40
116
111
112
41
0
str_6:
65
61
108
101
102
116
32
68
61
114
105
103
104
116
0
str_7:
112
108
97
121
101
114
50
32
40
98
111
116
116
111
109
41
0
str_8:
74
61
108
101
102
116
32
76
61
114
105
103
104
116
0
func_set_word:
  write 0 ram.0
  func_set_word_data:
  write 0 ram.1
  func_set_word_addr:
  write [ram.1] alu.1
  write 6144 alu.2
  write [alu.+] ram.1
  write [ram.0] [ram.1]
return
func_get_key:
  write 0 ram.0
  write 8192 ram.1
  write [ram.1] ram.2
  copy [ram.2] ram.3
  write [ram.3] ram.0
  write [ram.0] alu.1
  write 0 alu.2
  write [alu.>] ctl.cnd
  goto? while_0_end
  while_0_start:
    write [ram.0] alu.1
    write 0xf0 alu.2
    write [alu.=] ctl.cnd
    goto? if_0_1
      write [ram.1] ram.2
      copy [ram.2] ram.4
      write [ram.4] ram.0
    goto if_0_end
    if_0_1:
    write [ram.0] alu.1
    write 0xe0 alu.2
    write [alu.=] ctl.cnd
    goto? if_0_2
      //pass
    goto if_0_end
    if_0_2:
      return
    if_0_end:
    write [ram.1] ram.2
    copy [ram.2] ram.5
    write [ram.5] ram.0
  write [ram.0] alu.1
  write 0 alu.2
  write [alu.>] ctl.cnd
  goto? while_0_end
  goto while_0_start
  while_0_end:
return
func_draw_ball:
  write 0b0000000000000000 ram.0
  func_draw_ball_x:
  write 0b0000000000000000 ram.1
  func_draw_ball_y:
  write 0b0000000000000000 ram.2
  func_draw_ball_old_x:
  write 0b0000000000000000 ram.3
  func_draw_ball_old_y:
  write [ram.0] ram+.0
  write [ram.1] ram+.1
  call func_sys.vram.set_pixel_y
  write [ram.2] ram+.0
  write [ram.3] ram+.1
  write 0 ram+.2
  call func_sys.vram.set_pixel_data
return
func_sys.vram.set_pixel:
  write 0 ram.0
  func_sys.vram.set_pixel_x:
  write 0 ram.1
  func_sys.vram.set_pixel_y:
  write 1 ram.2
  func_sys.vram.set_pixel_data:
  write 0 ram.3
  write 0 ram.4
  write [ram.1] ram.5
  write [ram.5] alu.1
  write [alu.<<] ram.5
  write [ram.5] alu.1
  write [alu.<<] ram.5
  write [ram.5] alu.1
  write [alu.<<] ram.5
  write 0 ram.6
  write sys.vram.shifted_pixels ram.6
  write [ram.0] alu.1
  write 0 alu.2
  write [alu.=] ctl.cnd
  write [ctl.cnd] alu.1
  write [alu.!] ctl.cnd
  goto? if_1_end
    write [ram.0] ram.3
    write [ram.3] alu.1
    write [alu.>>] ram.3
    write [ram.3] alu.1
    write [alu.>>] ram.3
    write [ram.3] alu.1
    write [alu.>>] ram.3
    write [ram.3] alu.1
    write [alu.>>] ram.3
    write [ram.3] ram.4
    write [ram.4] alu.1
    write [alu.<<] ram.4
    write [ram.4] alu.1
    write [alu.<<] ram.4
    write [ram.4] alu.1
    write [alu.<<] ram.4
    write [ram.4] alu.1
    write [alu.<<] ram.4
    write [ram.0] alu.1
    write [ram.4] alu.2
    write [alu.-] ram.4
    write [ram.5] alu.1
    write [ram.3] alu.2
    write [alu.+] ram.5
  if_1_end:
  write [ram.6] alu.1
  write [ram.4] alu.2
  write [alu.+] ram.6
  write [ram.5] alu.1
  write 6144 alu.2
  write [alu.+] ram.5
  write [ram.2] ctl.cnd
  goto? if_2_1
    copy [ram.6] alu.1
    copy [ram.5] alu.2
    write [alu.|] [ram.5]
  goto if_2_end
  if_2_1:
    copy [ram.6] alu.1
    copy alu.! ram.6
    copy ram.6 alu.1
    copy [ram.5] alu.2
    write [alu.&] [ram.5]
  if_2_end:
return
func_draw_paddle:
  write 0 ram.0
  func_draw_paddle_x:
  write 0 ram.1
  func_draw_paddle_addr:
  write 0 ram.2
  func_draw_paddle_erase:
  write [ram.0] alu.1
  write [alu.>>] ram.3
  write [ram.1] alu.1
  write [ram.3] alu.2
  write [alu.+] ram.1
  write [ram.2] ctl.cnd
  goto? if_3_1
    write [ram.0] ctl.cnd
    goto? if_4_1
      write 0 ram+.0
      write [ram.1] ram+.1
      call func_set_word_addr
      write [ram.1] alu.1
      write 1 alu.2
      write [alu.+] ram.1
      write 0 ram+.0
      write [ram.1] ram+.1
      call func_set_word_addr
    goto if_4_end
    if_4_1:
      write 0 ram+.0
      write [ram.1] ram+.1
      call func_set_word_addr
    if_4_end:
  goto if_3_end
  if_3_1:
    write [ram.0] ctl.cnd
    goto? if_5_1
      write 0x00ff ram+.0
      write [ram.1] ram+.1
      call func_set_word_addr
      write [ram.1] alu.1
      write 1 alu.2
      write [alu.+] ram.1
      write 0xff00 ram+.0
      write [ram.1] ram+.1
      call func_set_word_addr
    goto if_5_end
    if_5_1:
      write 0xffff ram+.0
      write [ram.1] ram+.1
      call func_set_word_addr
    if_5_end:
  if_3_end:
return
func_sys.print_string:
  write str_0 ram.0
  func_sys.print_string_string:
  write 0 ram.1
  func_sys.print_string_x:
  write 0 ram.2
  func_sys.print_string_y:
  write [ram.0] ram.3
  write [ram.3] ram.4
  copy [ram.4] ram.5
  write [ram.5] ram.4
  write [ram.4] alu.1
  write 0 alu.2
  write [alu.>] ctl.cnd
  goto? while_1_end
  while_1_start:
    write [ram.4] ram+.0
    write [ram.1] ram+.1
    write [ram.2] ram+.2
    call func_sys.vram.render_char_y
    write [ram.1] alu.1
    write 1 alu.2
    write [alu.+] ram.1
    write [ram.1] alu.1
    write 15 alu.2
    write [alu.>] ctl.cnd
    goto? if_8_end
      write [ram.2] alu.1
      write 1 alu.2
      write [alu.+] ram.2
      write 0 ram.1
    if_8_end:
    write [ram.3] alu.1
    write 1 alu.2
    write [alu.+] ram.3
    write [ram.3] ram.6
    copy [ram.6] ram.7
    write [ram.7] ram.4
  write [ram.4] alu.1
  write 0 alu.2
  write [alu.>] ctl.cnd
  goto? while_1_end
  goto while_1_start
  while_1_end:
return
func_sys.vram.render_char:
  write 0 ram.0
  func_sys.vram.render_char_char_code:
  write 0 ram.1
  func_sys.vram.render_char_x:
  write 0 ram.2
  func_sys.vram.render_char_y:
  write [ram.0] alu.1
  write 32 alu.2
  write [alu.<] ctl.cnd
  goto? if_6_1
    write 127 ram.0
  goto if_6_end
  if_6_1:
  write [ram.0] alu.1
  write 129 alu.2
  write [alu.>] ctl.cnd
  goto? if_6_end
    write 127 ram.0
  goto if_6_end
  if_6_end:
  write [ram.0] alu.1
  write 32 alu.2
  write [alu.-] ram.0
  write 0 ram.3
  write [ram.0] ram.4
  write [ram.4] alu.1
  write [alu.<<] ram.4
  write [ram.4] alu.1
  write [alu.<<] ram.4
  write [ram.4] alu.1
  write [ram.0] alu.2
  write [alu.+] ram.4
  write [ram.4] alu.1
  write [ram.0] alu.2
  write [alu.+] ram.4
  write sys.vram.glyphs ram.3
  write [ram.3] alu.1
  write [ram.4] alu.2
  write [alu.+] ram.3
  write 6144 ram.5
  write [ram.1] alu.1
  write [alu.>>] ram.6
  write [ram.2] ram.7
  write [ram.7] alu.1
  write [alu.<<] ram.7
  write [ram.7] alu.1
  write [alu.<<] ram.7
  write [ram.7] alu.1
  write [alu.<<] ram.7
  write [ram.7] alu.1
  write [alu.<<] ram.7
  write [ram.7] alu.1
  write [alu.<<] ram.7
  write [ram.7] alu.1
  write [alu.<<] ram.7
  write [ram.5] alu.1
  write [ram.6] alu.2
  write [alu.+] ram.5
  write [ram.5] alu.1
  write [ram.7] alu.2
  write [alu.+] ram.5
  write [ram.5] alu.1
  write 8 alu.2
  write [alu.+] ram.5
  write 0xff00 ram.8
  write 0x00ff ram.9
  write [ram.1] ctl.cnd
  goto? if_7_end
    write 0x00ff ram.8
    write 0xff00 ram.9
  if_7_end:
  write 0 ram.10
  write [ram.10] alu.1
  write 6 alu.2
  write [alu.<] ctl.cnd
  goto? for_0_end
  for_0_start:
    copy [ram.3] alu.1
    copy ram.8 alu.2
    copy alu.& ram.12
    copy [ram.5] alu.1
    copy ram.9 alu.2
    copy alu.& ram.13
    copy ram.12 alu.1
    copy ram.13 alu.2
    copy alu.| [ram.5]
    write [ram.3] alu.1
    write 1 alu.2
    write [alu.+] ram.3
    write [ram.5] alu.1
    write 8 alu.2
    write [alu.+] ram.5
  write [ram.10] alu.1
  write 1 alu.2
  write [alu.+] ram.10
  write [ram.10] alu.1
  write 6 alu.2
  write [alu.<] ctl.cnd
  goto? for_0_end
  goto for_0_start
  for_0_end:
return
func_sys.vram.clear:
  write 0 ram+.0
  call func_sys.vram.fast_fill_data
return
func_sys.vram.fast_fill:
  write 0xffff ram.0
  func_sys.vram.fast_fill_data:
  write vram.0 alu.1
  func_sys.vram.fast_fill_loop:
  write 0 alu.2
  write [ram.0] [alu.+]
  write 1 alu.2
  write [ram.0] [alu.+]
  write 2 alu.2
  write [ram.0] [alu.+]
  write 3 alu.2
  write [ram.0] [alu.+]
  write 4 alu.2
  write [ram.0] [alu.+]
  write 5 alu.2
  write [ram.0] [alu.+]
  write 6 alu.2
  write [ram.0] [alu.+]
  write 7 alu.2
  write [ram.0] [alu.+]
  write 8 alu.2
  write [alu.+] ram.1
  write [ram.1] alu.1
  write vram.1023 alu.2
  write [alu.>] ctl.cnd
  goto? func_sys.vram.fast_fill_loop
return
func_sys.print_int:
  write 0 ram.0
  func_sys.print_int_num:
  write 0 ram.1
  func_sys.print_int_x:
  write 0 ram.2
  func_sys.print_int_y:
  write 0 ram.3
  func_sys.print_int_print_all_places:
  write [ram.1] ram.4
  write 0 ram.5
  write 48 ram.6
  write 48 ram.7
  write 48 ram.8
  write 48 ram.9
  write [ram.0] alu.1
  write 9999 alu.2
  write [alu.>] ctl.cnd
  goto? while_3_end
  while_3_start:
    write [ram.0] alu.1
    write 10000 alu.2
    write [alu.-] ram.0
    write [ram.6] alu.1
    write 1 alu.2
    write [alu.+] ram.6
    write 1 ram.5
  write [ram.0] alu.1
  write 9999 alu.2
  write [alu.>] ctl.cnd
  goto? while_3_end
  goto while_3_start
  while_3_end:
  write [ram.5] alu.1
  write [ram.3] alu.2
  write [alu.|] ctl.cnd
  goto? if_10_end
    write [ram.6] ram+.0
    write [ram.4] ram+.1
    write [ram.2] ram+.2
    call func_sys.vram.render_char_y
    write [ram.4] alu.1
    write 1 alu.2
    write [alu.+] ram.4
  if_10_end:
  write [ram.0] alu.1
  write 999 alu.2
  write [alu.>] ctl.cnd
  goto? while_4_end
  while_4_start:
    write [ram.0] alu.1
    write 1000 alu.2
    write [alu.-] ram.0
    write [ram.7] alu.1
    write 1 alu.2
    write [alu.+] ram.7
    write 1 ram.5
  write [ram.0] alu.1
  write 999 alu.2
  write [alu.>] ctl.cnd
  goto? while_4_end
  goto while_4_start
  while_4_end:
  write [ram.5] alu.1
  write [ram.3] alu.2
  write [alu.|] ctl.cnd
  goto? if_11_end
    write [ram.7] ram+.0
    write [ram.4] ram+.1
    write [ram.2] ram+.2
    call func_sys.vram.render_char_y
    write [ram.4] alu.1
    write 1 alu.2
    write [alu.+] ram.4
  if_11_end:
  write [ram.0] alu.1
  write 99 alu.2
  write [alu.>] ctl.cnd
  goto? while_5_end
  while_5_start:
    write [ram.0] alu.1
    write 100 alu.2
    write [alu.-] ram.0
    write [ram.8] alu.1
    write 1 alu.2
    write [alu.+] ram.8
    write 1 ram.5
  write [ram.0] alu.1
  write 99 alu.2
  write [alu.>] ctl.cnd
  goto? while_5_end
  goto while_5_start
  while_5_end:
  write [ram.5] alu.1
  write [ram.3] alu.2
  write [alu.|] ctl.cnd
  goto? if_12_end
    write [ram.8] ram+.0
    write [ram.4] ram+.1
    write [ram.2] ram+.2
    call func_sys.vram.render_char_y
    write [ram.4] alu.1
    write 1 alu.2
    write [alu.+] ram.4
  if_12_end:
  write [ram.0] alu.1
  write 9 alu.2
  write [alu.>] ctl.cnd
  goto? while_6_end
  while_6_start:
    write [ram.0] alu.1
    write 10 alu.2
    write [alu.-] ram.0
    write [ram.9] alu.1
    write 1 alu.2
    write [alu.+] ram.9
    write 1 ram.5
  write [ram.0] alu.1
  write 9 alu.2
  write [alu.>] ctl.cnd
  goto? while_6_end
  goto while_6_start
  while_6_end:
  write [ram.5] alu.1
  write [ram.3] alu.2
  write [alu.|] ctl.cnd
  goto? if_13_end
    write [ram.9] ram+.0
    write [ram.4] ram+.1
    write [ram.2] ram+.2
    call func_sys.vram.render_char_y
    write [ram.4] alu.1
    write 1 alu.2
    write [alu.+] ram.4
  if_13_end:
  write [ram.0] alu.1
  write 48 alu.2
  write [alu.+] ram+.0
  write [ram.4] ram+.1
  write [ram.2] ram+.2
  call func_sys.vram.render_char_y
return