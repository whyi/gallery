require "redis"

class ArtsService
  def self.get_arts
    @arts = $redis.get("arts")
    if @arts.nil?
      @arts = Art.all
      $redis.set("arts", @arts.to_json)
    end
    @arts
  end

  def self.create(art_params, current_user)
    @art = current_user.arts.create!(art_params)
    $redis.set("arts", Art.all.to_json) unless @art.nil?
  end

  def self.update(params)
    @art = Art.find(params[:id])
    $redis.set("arts", Art.all.to_json) if @art.update_attributes(params)
  end
end
