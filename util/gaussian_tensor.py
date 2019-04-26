import torch
from scipy import signal


def create_distributed_tensor_old(num_filters, num_samples=1000000, mean=1.0, std=0.5):
    normal = torch.distributions.Normal(torch.tensor([mean], dtype=torch.float32), torch.tensor([std], dtype=torch.float32))
    samples = normal.sample((num_samples,))
    hist = torch.histc(samples, bins=num_filters)/(num_samples/float(num_filters))
    distr_tensor = hist.unsqueeze(0).unsqueeze(0)
    return distr_tensor


def create_distributed_tensor(num_filters, std):
    window = signal.gaussian(num_filters, std=std)
    distr_tensor = torch.Tensor([[window]])
    return distr_tensor
