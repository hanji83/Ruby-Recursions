def eval_block(*args, &prc)
  return "NO BLOCK GIVEN!" if !block_given?
  prc.call(*args)
end