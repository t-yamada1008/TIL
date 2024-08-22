# 605._Can_Place_Flowers

# 強引にクリアしたけど、もっとスマートな方法があるはず
# @param {Integer[]} flowerbed
# @param {Integer} n
# @return {Boolean}
def can_place_flowers(flowerbed, n)
  result = 0
  flowerbed.each_with_index do |f, i|
      if i == 0
          if flowerbed[i] == 0 && flowerbed[i + 1] == 0
              result = result + 1
              flowerbed[i] = 1
          elsif flowerbed.length == 1
              if f == 0
                  result = result + 1
                  flowerbed[i] = 1
              end
          end
      elsif i == flowerbed.length - 1
          if flowerbed[i] == 0 && flowerbed[i - 1] == 0
              result = result + 1
              flowerbed[i] = 1
          end
      else
          if flowerbed[i] == 0 && flowerbed[i - 1] == 0 && flowerbed[i + 1] ==0
              result = result + 1
              flowerbed[i] = 1
          end
      end
  end

  n <= result ? true : false
end
