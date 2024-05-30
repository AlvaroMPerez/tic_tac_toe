tablero = Array.new(9 , " ")

def imprimir_tablero(tablero)
    puts "#{tablero[0]} | #{tablero[1]} | #{tablero[2]}"
    puts "--+---+--"
    puts "#{tablero[3]} | #{tablero[4]} | #{tablero[5]}"
    puts "--+---+--"
    puts "#{tablero[6]} | #{tablero[7]} | #{tablero[8]}"
end

def hay_ganador(tablero)
  combinaciones_ganadoras =[
    [0, 1, 2], # Fila 1
    [3, 4, 5], # Fila 2
    [6, 7, 8], # Fila 3
    [0, 3, 6], # Columna 1
    [1, 4, 7], # Columna 2
    [2, 5, 8], # Columna 3
    [0, 4, 8], # Diagonal principal
    [2, 4, 6]  # Diagonal secundaria
  ]

  combinaciones_ganadoras.each do |a, b, c|
    if tablero[a] == tablero[b] && tablero[b] == tablero[c] && tablero[a] != " "
      return tablero[a]
    end
  end
  nil
end

def gaming(tablero)
  jugador_actual = "X"

  loop do
    imprimir_tablero(tablero)
    print "Jugador #{jugador_actual}, elige una posicion del 1 al 9: "
    movimiento = gets.chomp.to_i - 1

    if movimiento < 0 || movimiento > 8
      puts "Por favor elige una opción válida."
      next
    end

    if tablero[movimiento] == " "
      tablero[movimiento] = jugador_actual
      ganador = hay_ganador(tablero)
      if ganador
        imprimir_tablero(tablero)
        puts "El jugador #{ganador} gana"
        break
      end
      jugador_actual = jugador_actual == "X" ? "O" : "X"
    else
      puts "Por favor elige una opcion valida"
    end

    if tablero.all? {|pos| pos != " "} #Esta parte itera sobre todas las posiciones del tablero y si son diferentes a " " detecta que es un empate.
      imprimir_tablero(tablero)
      puts "Es un empate, juguemos de nuevo!"
      break
    end
  end
end

gaming(tablero)
