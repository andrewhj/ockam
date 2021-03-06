/**
 * @file  urandom.h
 * @brief
 */

#ifndef OCKAM_RANDOM_URANDOM_H_
#define OCKAM_RANDOM_URANDOM_H_

#include "ockam/error.h"
#include "ockam/random.h"

#include "random/impl.h"

/**
 * @brief   Initialize the urandom random object
 * @param   random[in]  The ockam random object to initialize.
 * @return  OCKAM_ERROR_NONE on success.
 * @return  OCKAM_RANDOM_ERROR_INVALID_PARAM if invalid random pointer is received.
 */
ockam_error_t ockam_random_urandom_init(ockam_random_t* random);

#endif
