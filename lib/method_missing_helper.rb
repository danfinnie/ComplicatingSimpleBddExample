module MethodMissingHelper
  def method_missing(name, *args, &passed_blk)
    match = find_matching_proc(name.to_s)
  
    if match
      regex, method_blk = match
      method_blk[name.to_s.match(regex)]
    else
      super
    end
  end
  
  def respond_to_missing?(method_name, include_private = false)
    find_matching_proc(method_name.to_s) || super
  end

  private

  def find_matching_proc method_name
    method_missing_mapping.detect { |regex, _| method_name =~ regex }
  end

  def method_missing_mapping
    raise NotImplementedError, "Override me with a hash of Regex => Proc."
  end
end
