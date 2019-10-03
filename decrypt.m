
embed_counter=1
lll=N;

lll=lll-1;

op=1;
x=1;
y=1;
fk=0;

while (x ~=height)
    while (y ~=width)
        bit=1;
        fh=0;
        count=1;
        while (bit <= 3)
            z1 = x + 2;
            z2 = y + 2;
             %fprintf('x=%d  y=%d',x,y);
             %fprintf('\n')
            
            i4=1;
            j4=1;
            for i = x : z1
                for j = y : z2
                    %disp(o)
                    %o=o+1;
                    %disp(i," ",j);
                    %fprintf('%d %d',i,j);
                    %fprintf('\n')
            % If there are more bits remaining to embed 
                    %fprintf('embed=%d ',embed_counter)
                    %fprintf('\n')
                    if(embed_counter+1<= lll) 
                    
                    % Bit to change of the current pixel
                    if(bit==1)
                        LSB = mod(double(t(i, j)), 2);
                        ret1(i4,j4)=LSB;
                         
                     %fprintf('i=%d  j=%d  bit=%d i=%d j=%d ',i4,j4,bit,i,j);
                        j4=j4+1;
                        if(j4==4)
                            i4=i4+1;
                            j4=1;
                        end
                    elseif(bit==2)
                        LSB= mod(floor(double(t(i, j))/2), 2);
                        ret2(i4,j4)=LSB;
                     %fprintf('i=%d  j=%d  bit=%d i=%d j=%d ',i4,j4,bit,i,j);
                        
                        j4=j4+1;
                        if(j4==4)
                            i4=i4+1;
                            j4=1;
                        end
                    elseif(bit==3)
                        LSB= mod(floor(double(t(i, j))/4), 2);
                        ret3(i4,j4)=LSB;
                     %fprintf('i=%d  j=%d  bit=%d i=%d j=%d ',i4,j4,bit,i,j);
                        
                        j4=j4+1;
                        if(j4==4)
                            i4=i4+1;
                            j4=1;
                        end
                       
                    end
                        fprintf('\n')
                    count=count+1;
                   
                   if(count==28)
                        rot1=ret1(1,1);
                        rot2=ret1(1,2);
                        if(rot1==0 && rot2==1)
                            ret1(1,1)=ret1(3,1);
                            ret1(1,2)=ret1(2,1);
                            ret1(3,1)=0;
                            ret1(2,1)=1;
                            ret1=rot90(ret1,3);
                            ret2=rot90(ret2,3);
                            ret3=rot90(ret3,3);
                        
                            
                        elseif(rot1==1 && rot2==0)
                            
                            ret1(1,1)=ret1(3,3);
                            ret1(1,2)=ret1(3,2);
                            ret1(3,3)=1;
                            ret1(3,2)=0;
                            
                            ret1=rot90(ret1,2);
                            ret2=rot90(ret2,2);
                            ret3=rot90(ret3,2);
                    
                        elseif(rot1==1 && rot2==1)
                            
                            ret1(1,1)=ret1(1,3);
                            ret1(1,2)=ret1(2,3);
                            ret1(1,3)=1;
                            ret1(2,3)=1;
                            ret1=rot90(ret1,1);
                            ret2=rot90(ret2,1);
                            ret3=rot90(ret3,1);
                        
                        
                        end
                 
                        fk=0;
                        for i5 = 1 : 3
                            for i6 = 1 : 3
                                for i7 = 1 : 3
                                    fprintf('i7=%d',i7);
                                    fprintf('\n');
                                    if(i5==1)
                                        if((i6==1 && i7==1) || (i6==1 && i7==2))
                                            continue;
                                        end
                                        retrieve(op)=char(ret1(i6,i7)+48); 
                                        fprintf('op=%d i6=%d i7=%d',op,i6,i7);
                                        fprintf('\n');
                                        op=op+1;
                                    elseif(i5==2)
                                        retrieve(op)=char(ret2(i6,i7)+48);
                                        
                                        fprintf('op=%d i6=%d i7=%d',op,i6,i7);
                                        fprintf('\n');
                                        op=op+1;
                                    elseif(i5==3)
                                        retrieve(op)=char(ret3(i6,i7)+48); 
                                        
                                        fprintf('op=%d i6=%d i7=%d',op,i6,i7);
                                        fprintf('\n');
                                        op=op+1;
                                        fprintf("%d=",op);
                                        fprintf('/n');
                                        
                                    end
                                end
                            end
                        end
                    end
                    
                      %  fprintf('output====%d  input===%d etemp===%d lsb====%d  bit===%d',output(i,j),input(i,j),temp,LSB,bit);
                       % fprintf('\n')
                    % Increment the embed counter
                    
                    embed_counter = embed_counter+1; 
                    end
                end  
            end
            bit=bit+1;
        end
        y = y + 3;
    end
    y=1;
    x = x + 3;
    %fprintf('x=%d',x)
end
op=op-1;
oop=op;
l3=mod(op,8);
op=op-l3;
for kl=1:op
    retrieved(kl)=retrieve(kl);
end
retrieved = transpose(retrieved);
retrieved=retrieved(:);
% Write both the input and output images to local storage 
% Mention the path to a folder here. 

ori_str = char(bin2dec(reshape(retrieved,8,[]).').')

