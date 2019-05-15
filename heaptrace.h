/* Copyright (c) 2022 LG Electronics Inc. */
/* SPDX-License-Identifier: GPL-2.0 */
#ifndef HEAPTRACE_HEAPTRACE_H
#define HEAPTRACE_HEAPTRACE_H

#ifdef DEBUG
#define pr_dbg(fmt, ...) fprintf(stderr, fmt, ## __VA_ARGS__)
#else
#define pr_dbg(fmt, ...)
#endif

#define pr_out(fmt, ...) fprintf(stderr, fmt, ## __VA_ARGS__)

extern thread_local bool hook_guard;

struct opts {
	int idx;
	char *exename;
};

#endif /* HEAPTRACE_HEAPTRACE_H */