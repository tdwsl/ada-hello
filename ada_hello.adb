-- ada_hello.adb

with Ada.Text_IO; use Ada.Text_IO;

procedure Ada_Hello is
   Map_W : constant Natural := 13;
   Map_H : constant Natural := 13;
   Map : array (0 .. Map_W*Map_H-1) of Character :=
     ('#','#','#','#','#','#','#','#','#','#','#','#','#',
      '#','.','.','.','.','.','.','.','.','.','.','.','#',
      '#','.','.','.','.','.','.','.','.','.','.','.','#',
      '#','.','.','.','.','.','.','.','.','.','.','.','#',
      '#','.','.','.','.','.','.','.','.','.','.','.','#',
      '#','.','h','.','e','.','l','.','l','.','o','.','#',
      '#','.','.','.','.','.','.','.','.','.','.','.','#',
      '#','.','w','.','o','.','r','.','l','.','d','.','#',
      '#','.','.','.','.','.','.','.','.','.','.','.','#',
      '#','.','.','.','.','.','.','.','.','.','.','.','#',
      '#','.','.','.','.','.','.','.','.','.','.','.','#',
      '#','.','.','.','.','.','.','.','.','.','.','.','#',
      '#','#','#','#','#','#','#','#','#','#','#','#','#');

   Player_X : Natural := 1;
   Player_Y : Natural := 1;

   procedure Draw is
      O : Character;
   begin
      Set_Col (1);
      Set_Line (1);
      O := Map (Player_Y*Map_W+Player_X);
      Map (Player_Y*Map_W+Player_X) := '@';
      for I in 0 .. Map_W*Map_H-1 loop
         Put (Map (I));
         if (I+1) mod Map_W = 0 then
            Put_Line ("");
         end if;
      end loop;
      Map (Player_Y*Map_W+Player_X) := '.';
   end Draw;

   procedure Move_Player (XM, YM : Integer) is
      X, Y : Integer;
   begin
      X := Player_X + XM;
      Y := Player_Y + YM;
      if Map (Y*Map_W+X) = '.' then
         Player_X := X;
         Player_Y := Y;
      end if;
   end Move_Player;

   function Control return Boolean is
      C : Character;
   begin
      Get (C);
      case C is
         when 'h' => Move_Player (-1, 0);
         when 'j' => Move_Player (0, 1);
         when 'k' => Move_Player (0, -1);
         when 'l' => Move_Player (1, 0);
         when 'q' => return True;
         when others => null;
      end case;
      return False;
   end Control;

begin
   New_Page;
   Put_Line ("h/j/k/l / q");
   loop
      Draw;
      exit when Control;
   end loop;
end Ada_Hello;

