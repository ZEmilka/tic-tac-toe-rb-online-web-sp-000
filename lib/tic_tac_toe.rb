WIN_COMBINATIONS=[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

board=["X","X","X","X","X","X","X","X","X"]

def display_board(board)
  puts" #{board[0]} | #{board[1]} | #{board[2]} "
  puts"-----------"
  puts" #{board[3]} | #{board[4]} | #{board[5]} "
  puts"-----------"
  puts" #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def move(board,index,token)
  board[index]=token
end

def position_taken?(board,index)
  if board[index]==" " || board[index]==""
    return false
  else
    return true
  end
end

def valid_move?(board,index)
  index.between?(0,8) && !position_taken?(board,index)
end

def turn(board)
  puts"Please enter 1-9:"
  input=gets.strip
  index=input_to_index(input)
  if valid_move?(board,index)
    move(board,index,token)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
turn=0
board.each do |position|
  if position=="X" || position=="O"
    turn+=1
  end
end
return turn
end

def current_player(board)
  turn=turn_count(board)
 if turn % 2==0
  return"X"
 else
  return"O"
 end
end

WIN_COMBINATIONS=[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def won?(board)

 WIN_COMBINATIONS.each do |win_combination|
   win_index_1=win_combination[0]
   win_index_2=win_combination[1]
   win_index_3=win_combination[2]

   position_1=board[win_index_1]
   position_2=board[win_index_2]
   position_3=board[win_index_3]

   if position_1=="X" && position_2=="X" && position_3=="X"
     return win_combination
   elsif position_1=="O" && position_2=="O" && position_3=="O"
     return win_combination
   end
 end

 return false
end

def full?(board)
  if board.any?{|token| "X"!=token && "O"!=token }
    return false
  end
  return true
end

def draw?(board)
  if !won?(board) && full?(board)
  return true
  end
end

def over?(board)
 if draw?(board) || full?(board) || won?(board)
   return true
 else
   return false
 end
end

def winner(board)
  if !won?(board)
    return nil
  else
    board[won?(board)[0]]
  end
end
