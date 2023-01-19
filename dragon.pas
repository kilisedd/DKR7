﻿Uses  GraphABC;
var (m,wx,wy,g) := (100, 300,300,10);
Procedure ris(x1,y1,x2,y2,k:integer);
begin
     If k>0 then begin
          var xn:=(x1+x2) div 2 -(y2-y1) div 2;
          var yn:=(y1+y2) div 2 +(x2-x1) div 2;
          ris(x1,y1,xn,yn,k-1);
          ris(x2,y2,xn,yn,k-1)
     end
     else line(x1,y1,x2,y2)
end;
Procedure KeyDown(k: integer);
begin
 case K of
    VK_Down: wy -= 10;
    VK_Up: wy += 10; 
    VK_Left: wx += 10;  
    VK_Right: wx -= 10;
    VK_Escape: halt(1); //выход
    VK_A: if m < 500 then m+=10;
    VK_Z: if m > 20 then m-=10;
    VK_S: if g < 15 then g+=1;
    VK_X: if g > 2 then g-=1;
   end;
 Window.Clear; 
 ris(wx-m,wy,wx+m,wy,g);
 Redraw;
end; 
 
Begin
     SetWindowCaption('Фракталы: Кривая Дракона');
     SetWindowSize(790,500);
     LockDrawing;
     KeyDown(0);
     OnkeyDown += KeyDown;
End.