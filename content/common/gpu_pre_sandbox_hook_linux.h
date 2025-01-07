// Copyright 2017 The Chromium Authors
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef CONTENT_COMMON_GPU_PRE_SANDBOX_HOOK_LINUX_H_
#define CONTENT_COMMON_GPU_PRE_SANDBOX_HOOK_LINUX_H_

#include "build/build_config.h"
#include "base/component_export.h"
#if BUILDFLAG(IS_BSD)
#include "sandbox/policy/sandbox.h"
#else
#include "sandbox/policy/linux/sandbox_linux.h"
#endif

namespace content {

// A pre-sandbox hook to use on Linux-based systems in sandboxed processes that
// require general GPU usage.
COMPONENT_EXPORT(GPU_PRE_SANDBOX_HOOK)
bool GpuPreSandboxHook(sandbox::policy::SandboxLinux::Options options);

}  // namespace content

#endif  // CONTENT_COMMON_GPU_PRE_SANDBOX_HOOK_LINUX_H_
