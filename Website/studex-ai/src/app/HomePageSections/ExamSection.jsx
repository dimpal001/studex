import React from 'react'

const ExamSection = () => {
  return (
    <section
      id='exam-system'
      className='bg-gradient-to-b from-gray-50 to-white py-20 dark:from-neutral-900 dark:to-neutral-800'
    >
      <div className='container mx-auto px-4'>
        <div className='mx-auto mb-16 max-w-3xl text-center'>
          <span className='inline-block rounded-full bg-rose-100 px-3 py-1 text-sm font-semibold text-rose-800 dark:bg-rose-900/30 dark:text-rose-300'>
            Exam System
          </span>
          <h2 className='animate__animated animate__fadeIn mt-4 text-3xl font-bold leading-tight text-gray-900 dark:text-white sm:text-4xl lg:text-5xl'>
            Smart MCQ-Based Exams
          </h2>
          <p className='mt-4 text-xl text-gray-600 dark:text-gray-300'>
            Create custom exams, take tests, and challenge friends with our
            intelligent exam system
          </p>
        </div>

        <div className='grid gap-12 lg:grid-cols-2'>
          <div className='flex flex-col justify-center'>
            <h3 className='mb-6 text-2xl font-bold text-gray-900 dark:text-white md:text-3xl'>
              Test Your Knowledge With Smart Exams
            </h3>
            <p className='mb-8 text-lg text-gray-600 dark:text-gray-400'>
              Our intelligent exam system automatically generates questions
              based on your selected parameters, tracks your progress, and helps
              you identify areas for improvement.
            </p>

            <div className='space-y-6'>
              <div className='animate__animated animate__fadeInLeft flex items-start'>
                <div className='flex-shrink-0'>
                  <div className='flex h-12 w-12 items-center justify-center rounded-md bg-rose-100 text-rose-600 dark:bg-rose-900/30 dark:text-rose-400'>
                    <svg
                      xmlns='http://www.w3.org/2000/svg'
                      className='h-6 w-6'
                      fill='none'
                      viewBox='0 0 24 24'
                      stroke='currentColor'
                      data-darkreader-inline-stroke=''
                      styles='--darkreader-inline-stroke: currentColor;'
                    >
                      <path
                        stroke-linecap='round'
                        stroke-linejoin='round'
                        stroke-width='2'
                        d='M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01'
                      ></path>
                    </svg>
                  </div>
                </div>
                <div className='ml-4'>
                  <h4 className='text-xl font-semibold text-gray-900 dark:text-white'>
                    Custom Exam Creation
                  </h4>
                  <p className='mt-2 text-gray-600 dark:text-gray-400'>
                    Create personalized exams by selecting subject, topic,
                    number of questions, and duration. Our system generates a
                    unique exam tailored to your needs.
                  </p>
                </div>
              </div>

              <div className='animate__animated animate__fadeInLeft animate__delay-1s flex items-start'>
                <div className='flex-shrink-0'>
                  <div className='flex h-12 w-12 items-center justify-center rounded-md bg-amber-100 text-amber-600 dark:bg-amber-900/30 dark:text-amber-400'>
                    <svg
                      xmlns='http://www.w3.org/2000/svg'
                      className='h-6 w-6'
                      fill='none'
                      viewBox='0 0 24 24'
                      stroke='currentColor'
                      data-darkreader-inline-stroke=''
                      styles='--darkreader-inline-stroke: currentColor;'
                    >
                      <path
                        stroke-linecap='round'
                        stroke-linejoin='round'
                        stroke-width='2'
                        d='M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z'
                      ></path>
                    </svg>
                  </div>
                </div>
                <div className='ml-4'>
                  <h4 className='text-xl font-semibold text-gray-900 dark:text-white'>
                    Timed Assessments
                  </h4>
                  <p className='mt-2 text-gray-600 dark:text-gray-400'>
                    Practice under real exam conditions with customizable time
                    limits. Improve your time management skills and prepare
                    effectively for actual tests.
                  </p>
                </div>
              </div>

              <div className='animate__animated animate__fadeInLeft animate__delay-2s flex items-start'>
                <div className='flex-shrink-0'>
                  <div className='flex h-12 w-12 items-center justify-center rounded-md bg-green-100 text-green-600 dark:bg-green-900/30 dark:text-green-400'>
                    <svg
                      xmlns='http://www.w3.org/2000/svg'
                      className='h-6 w-6'
                      fill='none'
                      viewBox='0 0 24 24'
                      stroke='currentColor'
                      data-darkreader-inline-stroke=''
                      styles='--darkreader-inline-stroke: currentColor;'
                    >
                      <path
                        stroke-linecap='round'
                        stroke-linejoin='round'
                        stroke-width='2'
                        d='M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z'
                      ></path>
                    </svg>
                  </div>
                </div>
                <div className='ml-4'>
                  <h4 className='text-xl font-semibold text-gray-900 dark:text-white'>
                    Detailed Analytics
                  </h4>
                  <p className='mt-2 text-gray-600 dark:text-gray-400'>
                    Get comprehensive performance reports highlighting your
                    strengths and areas for improvement. Track your progress
                    over time with visual charts.
                  </p>
                </div>
              </div>

              <div className='animate__animated animate__fadeInLeft animate__delay-3s flex items-start'>
                <div className='flex-shrink-0'>
                  <div className='flex h-12 w-12 items-center justify-center rounded-md bg-blue-100 text-blue-600 dark:bg-blue-900/30 dark:text-blue-400'>
                    <svg
                      xmlns='http://www.w3.org/2000/svg'
                      className='h-6 w-6'
                      fill='none'
                      viewBox='0 0 24 24'
                      stroke='currentColor'
                      data-darkreader-inline-stroke=''
                      styles='--darkreader-inline-stroke: currentColor;'
                    >
                      <path
                        stroke-linecap='round'
                        stroke-linejoin='round'
                        stroke-width='2'
                        d='M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z'
                      ></path>
                    </svg>
                  </div>
                </div>
                <div className='ml-4'>
                  <h4 className='text-xl font-semibold text-gray-900 dark:text-white'>
                    Challenge Friends
                  </h4>
                  <p className='mt-2 text-gray-600 dark:text-gray-400'>
                    Send exam challenges to friends and compete for the highest
                    score. Compare results and motivate each other to excel.
                  </p>
                </div>
              </div>
            </div>
          </div>

          <div className='mt-8 flex items-center justify-center lg:mt-0'>
            <div className='relative max-w-md'>
              <div className='absolute -left-10 -top-10 h-32 w-32 rounded-full bg-purple-300 opacity-20 blur-3xl dark:bg-purple-700'></div>
              <div className='absolute -bottom-8 -right-8 h-32 w-32 rounded-full bg-rose-300 opacity-20 blur-3xl dark:bg-rose-700'></div>

              <div className='animate__animated animate__zoomIn relative rounded-[2.5rem] border-[14px] border-gray-800 bg-gray-800 shadow-xl dark:border-gray-700'>
                <div className='absolute left-1/2 top-0 h-5 w-24 -translate-x-1/2 -translate-y-1/2 rounded-b-lg rounded-t-2xl bg-gray-800 dark:bg-gray-700'></div>
                <div className='overflow-hidden rounded-[2rem] bg-white dark:bg-gray-800'>
                  <div className='relative'>
                    <div className='bg-gradient-to-r from-rose-600 to-purple-600 p-4 text-white'>
                      <div className='flex items-center justify-between'>
                        <div className='flex items-center'>
                          <button className='mr-2 rounded-full bg-white/10 p-1'>
                            <svg
                              xmlns='http://www.w3.org/2000/svg'
                              className='h-5 w-5'
                              viewBox='0 0 20 20'
                              fill='currentColor'
                              data-darkreader-inline-fill=''
                              styles='--darkreader-inline-fill: currentColor;'
                            >
                              <path
                                fill-rule='evenodd'
                                d='M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z'
                                clip-rule='evenodd'
                              ></path>
                            </svg>
                          </button>
                          <span className='text-sm font-semibold'>
                            Science Quiz
                          </span>
                        </div>
                        <div className='rounded-lg bg-white/20 px-2 py-1 text-xs font-medium'>
                          12:45 left
                        </div>
                      </div>

                      <div className='mt-3'>
                        <div className='flex justify-between text-xs'>
                          <span>Question 8 of 15</span>
                          <span>Score: 7/7</span>
                        </div>
                        <div className='mt-1 h-1.5 w-full overflow-hidden rounded-full bg-white/20'>
                          <div className='h-full w-[53%] rounded-full bg-white'></div>
                        </div>
                      </div>
                    </div>

                    <div className='h-[400px] bg-white p-4 dark:bg-neutral-900'>
                      <div className='rounded-xl bg-white p-4 shadow-sm dark:bg-neutral-800'>
                        <h4 className='mb-3 text-lg font-medium text-gray-900 dark:text-white'>
                          Question 8
                        </h4>
                        <p className='mb-6 text-gray-800 dark:text-gray-200'>
                          Which of the following is NOT a greenhouse gas?
                        </p>

                        <div className='space-y-3'>
                          <div className='flex cursor-pointer items-center rounded-lg border border-gray-200 px-4 py-3 hover:bg-gray-50 dark:border-gray-700 dark:hover:bg-neutral-700'>
                            <div className='h-5 w-5 flex-shrink-0 rounded-full border border-gray-300 bg-white dark:border-gray-600 dark:bg-neutral-700'></div>
                            <span className='ml-3 text-gray-700 dark:text-gray-300'>
                              Carbon Dioxide (CO₂)
                            </span>
                          </div>

                          <div className='flex cursor-pointer items-center rounded-lg border border-gray-200 px-4 py-3 hover:bg-gray-50 dark:border-gray-700 dark:hover:bg-neutral-700'>
                            <div className='h-5 w-5 flex-shrink-0 rounded-full border border-gray-300 bg-white dark:border-gray-600 dark:bg-neutral-700'></div>
                            <span className='ml-3 text-gray-700 dark:text-gray-300'>
                              Methane (CH₄)
                            </span>
                          </div>

                          <div className='flex cursor-pointer items-center rounded-lg border border-rose-200 bg-rose-50 px-4 py-3 dark:border-rose-900/50 dark:bg-rose-900/20'>
                            <div className='flex h-5 w-5 flex-shrink-0 items-center justify-center rounded-full bg-rose-600 text-white'>
                              <svg
                                xmlns='http://www.w3.org/2000/svg'
                                className='h-3 w-3'
                                viewBox='0 0 20 20'
                                fill='currentColor'
                                data-darkreader-inline-fill=''
                                styles='--darkreader-inline-fill: currentColor;'
                              >
                                <path
                                  fill-rule='evenodd'
                                  d='M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z'
                                  clip-rule='evenodd'
                                ></path>
                              </svg>
                            </div>
                            <span className='ml-3 font-medium text-rose-800 dark:text-rose-300'>
                              Nitrogen (N₂)
                            </span>
                          </div>

                          <div className='flex cursor-pointer items-center rounded-lg border border-gray-200 px-4 py-3 hover:bg-gray-50 dark:border-gray-700 dark:hover:bg-neutral-700'>
                            <div className='h-5 w-5 flex-shrink-0 rounded-full border border-gray-300 bg-white dark:border-gray-600 dark:bg-neutral-700'></div>
                            <span className='ml-3 text-gray-700 dark:text-gray-300'>
                              Nitrous Oxide (N₂O)
                            </span>
                          </div>
                        </div>

                        <div className='mt-4 rounded-lg bg-green-50 p-3 dark:bg-green-900/20'>
                          <h5 className='flex items-center text-sm font-medium text-green-800 dark:text-green-300'>
                            <svg
                              xmlns='http://www.w3.org/2000/svg'
                              className='mr-2 h-4 w-4'
                              viewBox='0 0 20 20'
                              fill='currentColor'
                              data-darkreader-inline-fill=''
                              styles='--darkreader-inline-fill: currentColor;'
                            >
                              <path
                                fill-rule='evenodd'
                                d='M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z'
                                clip-rule='evenodd'
                              ></path>
                            </svg>
                            Correct Answer: Nitrogen (N₂)
                          </h5>
                          <p className='mt-1 text-xs text-green-700 dark:text-green-400'>
                            Nitrogen makes up about 78% of Earth's atmosphere
                            but is not a greenhouse gas. The main greenhouse
                            gases are carbon dioxide, methane, nitrous oxide,
                            and water vapor.
                          </p>
                        </div>
                      </div>

                      <div className='mt-4 flex justify-between'>
                        <button className='flex items-center rounded-lg border border-gray-300 px-4 py-2 text-sm font-medium text-gray-700 transition-colors hover:bg-gray-50 dark:border-gray-600 dark:text-gray-300 dark:hover:bg-neutral-700'>
                          <svg
                            xmlns='http://www.w3.org/2000/svg'
                            className='mr-1 h-4 w-4'
                            viewBox='0 0 20 20'
                            fill='currentColor'
                            data-darkreader-inline-fill=''
                            styles='--darkreader-inline-fill: currentColor;'
                          >
                            <path
                              fill-rule='evenodd'
                              d='M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z'
                              clip-rule='evenodd'
                            ></path>
                          </svg>
                          Previous
                        </button>
                        <button className='flex items-center rounded-lg bg-rose-600 px-4 py-2 text-sm font-medium text-white transition-colors hover:bg-rose-700 dark:bg-rose-700 dark:hover:bg-rose-600'>
                          Next
                          <svg
                            xmlns='http://www.w3.org/2000/svg'
                            className='ml-1 h-4 w-4'
                            viewBox='0 0 20 20'
                            fill='currentColor'
                            data-darkreader-inline-fill=''
                            styles='--darkreader-inline-fill: currentColor;'
                          >
                            <path
                              fill-rule='evenodd'
                              d='M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z'
                              clip-rule='evenodd'
                            ></path>
                          </svg>
                        </button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div className='animate__animated animate__fadeInRight animate__delay-2s absolute -right-20 -top-10 w-52 rounded-xl border-[8px] border-gray-800 bg-white p-2 shadow-xl dark:border-gray-700 dark:bg-neutral-900 md:block'>
                <div className='rounded-lg bg-indigo-50 p-3 dark:bg-indigo-900/30'>
                  <div className='mb-2 text-center'>
                    <div className='inline-flex h-12 w-12 items-center justify-center rounded-full bg-indigo-100 dark:bg-indigo-900/50'>
                      <svg
                        xmlns='http://www.w3.org/2000/svg'
                        className='h-6 w-6 text-indigo-600 dark:text-indigo-400'
                        viewBox='0 0 20 20'
                        fill='currentColor'
                        data-darkreader-inline-fill=''
                        styles='--darkreader-inline-fill: currentColor;'
                      >
                        <path d='M9 2a1 1 0 000 2h2a1 1 0 100-2H9z'></path>
                        <path
                          fill-rule='evenodd'
                          d='M4 5a2 2 0 012-2 3 3 0 003 3h2a3 3 0 003-3 2 2 0 012 2v11a2 2 0 01-2 2H6a2 2 0 01-2-2V5zm3 4a1 1 0 000 2h.01a1 1 0 100-2H7zm3 0a1 1 0 000 2h3a1 1 0 100-2h-3zm-3 4a1 1 0 100 2h.01a1 1 0 100-2H7zm3 0a1 1 0 100 2h3a1 1 0 100-2h-3z'
                          clip-rule='evenodd'
                        ></path>
                      </svg>
                    </div>
                    <h4 className='mt-2 text-sm font-semibold text-gray-900 dark:text-white'>
                      Physics Quiz
                    </h4>
                    <p className='text-xs text-gray-500 dark:text-gray-400'>
                      Results
                    </p>
                  </div>

                  <div className='space-y-2'>
                    <div className='flex items-center justify-between text-xs'>
                      <span className='font-medium text-gray-700 dark:text-gray-300'>
                        Score:
                      </span>
                      <span className='font-bold text-indigo-600 dark:text-indigo-400'>
                        85%
                      </span>
                    </div>
                    <div className='flex items-center justify-between text-xs'>
                      <span className='font-medium text-gray-700 dark:text-gray-300'>
                        Correct:
                      </span>
                      <span className='font-bold text-green-600 dark:text-green-400'>
                        17/20
                      </span>
                    </div>
                    <div className='flex items-center justify-between text-xs'>
                      <span className='font-medium text-gray-700 dark:text-gray-300'>
                        Time taken:
                      </span>
                      <span className='font-bold text-gray-900 dark:text-gray-100'>
                        18:45
                      </span>
                    </div>

                    <div className='mt-3 text-center'>
                      <button className='w-full rounded-lg bg-indigo-600 py-1.5 text-xs font-medium text-white hover:bg-indigo-700 dark:bg-indigo-700 dark:hover:bg-indigo-600'>
                        View Details
                      </button>
                    </div>
                  </div>
                </div>
              </div>

              <div className='animate__animated animate__fadeInLeft animate__delay-3s absolute -bottom-10 -left-10 w-48 rounded-xl border-[8px] border-gray-800 bg-white p-2 shadow-xl dark:border-gray-700 dark:bg-neutral-900 md:block'>
                <div className='overflow-hidden rounded-lg bg-amber-50 p-3 dark:bg-amber-900/30'>
                  <div className='text-center'>
                    <div className='inline-flex h-10 w-10 items-center justify-center rounded-full bg-amber-100 dark:bg-amber-900/50'>
                      <svg
                        xmlns='http://www.w3.org/2000/svg'
                        className='h-5 w-5 text-amber-600 dark:text-amber-400'
                        viewBox='0 0 20 20'
                        fill='currentColor'
                        data-darkreader-inline-fill=''
                        styles='--darkreader-inline-fill: currentColor;'
                      >
                        <path
                          fill-rule='evenodd'
                          d='M10 18a8 8 0 100-16 8 8 0 000 16zM9.555 7.168A1 1 0 008 8v4a1 1 0 001.555.832l3-2a1 1 0 000-1.664l-3-2z'
                          clip-rule='evenodd'
                        ></path>
                      </svg>
                    </div>
                    <h4 className='mt-2 text-xs font-semibold text-gray-900 dark:text-white'>
                      Challenge Sent!
                    </h4>
                  </div>

                  <div className='mt-2 flex items-center'>
                    <div className='flex h-8 w-8 items-center justify-center rounded-full bg-gray-200 text-xs font-semibold text-gray-700 dark:bg-gray-700 dark:text-gray-300'>
                      RM
                    </div>
                    <div className='ml-2'>
                      <div className='text-xs font-medium text-gray-900 dark:text-white'>
                        Rahul Mehta
                      </div>
                      <div className='text-[10px] text-gray-500 dark:text-gray-400'>
                        Accepted
                      </div>
                    </div>
                  </div>

                  <div className='mt-2 rounded-md bg-white p-2 dark:bg-neutral-800'>
                    <div className='text-center text-[10px] text-gray-500 dark:text-gray-400'>
                      Challenge expires in
                    </div>
                    <div className='mt-1 flex justify-center space-x-2 text-xs'>
                      <div className='flex h-6 w-6 items-center justify-center rounded bg-amber-100 font-semibold text-amber-800 dark:bg-amber-900/50 dark:text-amber-300'>
                        12
                      </div>
                      <div className='flex h-6 w-6 items-center justify-center rounded bg-amber-100 font-semibold text-amber-800 dark:bg-amber-900/50 dark:text-amber-300'>
                        45
                      </div>
                      <div className='flex h-6 w-6 items-center justify-center rounded bg-amber-100 font-semibold text-amber-800 dark:bg-amber-900/50 dark:text-amber-300'>
                        32
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div className='mt-24'>
          <div className='mx-auto mb-12 max-w-xl text-center'>
            <h3 className='text-2xl font-bold text-gray-900 dark:text-white md:text-3xl'>
              Track Your Progress
            </h3>
            <p className='mt-4 text-lg text-gray-600 dark:text-gray-400'>
              Monitor your performance, earn achievements, and celebrate your
              learning journey
            </p>
          </div>

          <div className='grid gap-8 md:grid-cols-2 lg:grid-cols-4'>
            <div className='animate__animated animate__fadeIn group overflow-hidden rounded-xl bg-gradient-to-b from-rose-500 to-pink-600 p-1 shadow-lg dark:from-rose-600 dark:to-pink-700'>
              <div className='h-full rounded-lg bg-white p-6 transition-transform duration-300 group-hover:-translate-y-1 dark:bg-neutral-900'>
                <div className='flex h-12 w-12 items-center justify-center rounded-full bg-rose-100 text-rose-600 dark:bg-rose-900/30 dark:text-rose-400'>
                  <svg
                    xmlns='http://www.w3.org/2000/svg'
                    className='h-6 w-6'
                    fill='none'
                    viewBox='0 0 24 24'
                    stroke='currentColor'
                    data-darkreader-inline-stroke=''
                    styles='--darkreader-inline-stroke: currentColor;'
                  >
                    <path
                      stroke-linecap='round'
                      stroke-linejoin='round'
                      stroke-width='2'
                      d='M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z'
                    ></path>
                  </svg>
                </div>
                <h4 className='mt-4 text-xl font-bold text-gray-900 dark:text-white'>
                  Exams Completed
                </h4>
                <div className='mt-2 text-3xl font-extrabold text-rose-600 dark:text-rose-400'>
                  128
                </div>
                <p className='mt-2 text-sm text-gray-600 dark:text-gray-400'>
                  Track your journey through completed assessments
                </p>
              </div>
            </div>

            <div className='animate__animated animate__fadeIn animate__delay-1s group overflow-hidden rounded-xl bg-gradient-to-b from-purple-500 to-indigo-600 p-1 shadow-lg dark:from-purple-600 dark:to-indigo-700'>
              <div className='h-full rounded-lg bg-white p-6 transition-transform duration-300 group-hover:-translate-y-1 dark:bg-neutral-900'>
                <div className='flex h-12 w-12 items-center justify-center rounded-full bg-purple-100 text-purple-600 dark:bg-purple-900/30 dark:text-purple-400'>
                  <svg
                    xmlns='http://www.w3.org/2000/svg'
                    className='h-6 w-6'
                    fill='none'
                    viewBox='0 0 24 24'
                    stroke='currentColor'
                    data-darkreader-inline-stroke=''
                    styles='--darkreader-inline-stroke: currentColor;'
                  >
                    <path
                      stroke-linecap='round'
                      stroke-linejoin='round'
                      stroke-width='2'
                      d='M12 6V4m0 2a2 2 0 100 4m0-4a2 2 0 110 4m-6 8a2 2 0 100-4m0 4a2 2 0 110-4m0 4v2m0-6V4m6 6v10m6-2a2 2 0 100-4m0 4a2 2 0 110-4m0 4v2m0-6V4'
                    ></path>
                  </svg>
                </div>
                <h4 className='mt-4 text-xl font-bold text-gray-900 dark:text-white'>
                  Accuracy Rate
                </h4>
                <div className='mt-2 text-3xl font-extrabold text-purple-600 dark:text-purple-400'>
                  82%
                </div>
                <p className='mt-2 text-sm text-gray-600 dark:text-gray-400'>
                  Your average percentage of correct answers
                </p>
              </div>
            </div>

            <div className='animate__animated animate__fadeIn animate__delay-2s group overflow-hidden rounded-xl bg-gradient-to-b from-blue-500 to-cyan-600 p-1 shadow-lg dark:from-blue-600 dark:to-cyan-700'>
              <div className='h-full rounded-lg bg-white p-6 transition-transform duration-300 group-hover:-translate-y-1 dark:bg-neutral-900'>
                <div className='flex h-12 w-12 items-center justify-center rounded-full bg-blue-100 text-blue-600 dark:bg-blue-900/30 dark:text-blue-400'>
                  <svg
                    xmlns='http://www.w3.org/2000/svg'
                    className='h-6 w-6'
                    fill='none'
                    viewBox='0 0 24 24'
                    stroke='currentColor'
                    data-darkreader-inline-stroke=''
                    styles='--darkreader-inline-stroke: currentColor;'
                  >
                    <path
                      stroke-linecap='round'
                      stroke-linejoin='round'
                      stroke-width='2'
                      d='M13 10V3L4 14h7v7l9-11h-7z'
                    ></path>
                  </svg>
                </div>
                <h4 className='mt-4 text-xl font-bold text-gray-900 dark:text-white'>
                  Fastest Time
                </h4>
                <div className='mt-2 text-3xl font-extrabold text-blue-600 dark:text-blue-400'>
                  01:42
                </div>
                <p className='mt-2 text-sm text-gray-600 dark:text-gray-400'>
                  Your record time per question on quizzes
                </p>
              </div>
            </div>

            <div className='animate__animated animate__fadeIn animate__delay-3s group overflow-hidden rounded-xl bg-gradient-to-b from-amber-500 to-orange-600 p-1 shadow-lg dark:from-amber-600 dark:to-orange-700'>
              <div className='h-full rounded-lg bg-white p-6 transition-transform duration-300 group-hover:-translate-y-1 dark:bg-neutral-900'>
                <div className='flex h-12 w-12 items-center justify-center rounded-full bg-amber-100 text-amber-600 dark:bg-amber-900/30 dark:text-amber-400'>
                  <svg
                    xmlns='http://www.w3.org/2000/svg'
                    className='h-6 w-6'
                    fill='none'
                    viewBox='0 0 24 24'
                    stroke='currentColor'
                    data-darkreader-inline-stroke=''
                    styles='--darkreader-inline-stroke: currentColor;'
                  >
                    <path
                      stroke-linecap='round'
                      stroke-linejoin='round'
                      stroke-width='2'
                      d='M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z'
                    ></path>
                  </svg>
                </div>
                <h4 className='mt-4 text-xl font-bold text-gray-900 dark:text-white'>
                  Challenges Won
                </h4>
                <div className='mt-2 text-3xl font-extrabold text-amber-600 dark:text-amber-400'>
                  42
                </div>
                <p className='mt-2 text-sm text-gray-600 dark:text-gray-400'>
                  Number of challenges you've won against peers
                </p>
              </div>
            </div>
          </div>
        </div>

        <div className='mt-16 rounded-2xl bg-gradient-to-r from-gray-50 to-gray-100 p-8 dark:from-neutral-800 dark:to-neutral-900'>
          <div className='mx-auto max-w-5xl'>
            <div className='text-center'>
              <h3 className='text-2xl font-bold text-gray-900 dark:text-white'>
                Unlock Achievements
              </h3>
              <p className='mt-2 text-gray-600 dark:text-gray-400'>
                Earn badges as you master different subjects and complete
                challenges
              </p>
            </div>

            <div className='mt-8 grid gap-4 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-5'>
              <div className='group rounded-lg bg-white p-4 text-center shadow-md transition-all duration-300 hover:shadow-lg dark:bg-neutral-800'>
                <div className='mx-auto flex h-16 w-16 items-center justify-center rounded-full bg-rose-100 transition-transform duration-300 group-hover:scale-110 dark:bg-rose-900/30'>
                  <svg
                    xmlns='http://www.w3.org/2000/svg'
                    className='h-8 w-8 text-rose-600 dark:text-rose-400'
                    fill='none'
                    viewBox='0 0 24 24'
                    stroke='currentColor'
                    data-darkreader-inline-stroke=''
                    styles='--darkreader-inline-stroke: currentColor;'
                  >
                    <path
                      stroke-linecap='round'
                      stroke-linejoin='round'
                      stroke-width='2'
                      d='M9.663 17h4.673M12 3v1m6.364 1.636l-.707.707M21 12h-1M4 12H3m3.343-5.657l-.707-.707m2.828 9.9a5 5 0 117.072 0l-.548.547A3.374 3.374 0 0014 18.469V19a2 2 0 11-4 0v-.531c0-.895-.356-1.754-.988-2.386l-.548-.547z'
                    ></path>
                  </svg>
                </div>
                <h5 className='mt-3 text-sm font-semibold text-gray-900 dark:text-white'>
                  Quiz Wizard
                </h5>
                <p className='mt-1 text-xs text-gray-500 dark:text-gray-400'>
                  Complete 50 quizzes
                </p>
              </div>

              <div className='group rounded-lg bg-white p-4 text-center shadow-md transition-all duration-300 hover:shadow-lg dark:bg-neutral-800'>
                <div className='mx-auto flex h-16 w-16 items-center justify-center rounded-full bg-purple-100 transition-transform duration-300 group-hover:scale-110 dark:bg-purple-900/30'>
                  <svg
                    xmlns='http://www.w3.org/2000/svg'
                    className='h-8 w-8 text-purple-600 dark:text-purple-400'
                    fill='none'
                    viewBox='0 0 24 24'
                    stroke='currentColor'
                    data-darkreader-inline-stroke=''
                    styles='--darkreader-inline-stroke: currentColor;'
                  >
                    <path
                      stroke-linecap='round'
                      stroke-linejoin='round'
                      stroke-width='2'
                      d='M13 10V3L4 14h7v7l9-11h-7z'
                    ></path>
                  </svg>
                </div>
                <h5 className='mt-3 text-sm font-semibold text-gray-900 dark:text-white'>
                  Speed Demon
                </h5>
                <p className='mt-1 text-xs text-gray-500 dark:text-gray-400'>
                  Answer 20 questions in 2 minutes
                </p>
              </div>

              <div className='group rounded-lg bg-white p-4 text-center shadow-md transition-all duration-300 hover:shadow-lg dark:bg-neutral-800'>
                <div className='mx-auto flex h-16 w-16 items-center justify-center rounded-full bg-amber-100 transition-transform duration-300 group-hover:scale-110 dark:bg-amber-900/30'>
                  <svg
                    xmlns='http://www.w3.org/2000/svg'
                    className='h-8 w-8 text-amber-600 dark:text-amber-400'
                    fill='none'
                    viewBox='0 0 24 24'
                    stroke='currentColor'
                    data-darkreader-inline-stroke=''
                    styles='--darkreader-inline-stroke: currentColor;'
                  >
                    <path
                      stroke-linecap='round'
                      stroke-linejoin='round'
                      stroke-width='2'
                      d='M11.049 2.927c.3-.921 1.603-.921 1.902 0l1.519 4.674a1 1 0 00.95.69h4.915c.969 0 1.371 1.24.588 1.81l-3.976 2.888a1 1 0 00-.363 1.118l1.518 4.674c.3.922-.755 1.688-1.538 1.118l-3.976-2.888a1 1 0 00-1.176 0l-3.976 2.888c-.783.57-1.838-.197-1.538-1.118l1.518-4.674a1 1 0 00-.363-1.118l-3.976-2.888c-.784-.57-.38-1.81.588-1.81h4.914a1 1 0 00.951-.69l1.519-4.674z'
                    ></path>
                  </svg>
                </div>
                <h5 className='mt-3 text-sm font-semibold text-gray-900 dark:text-white'>
                  Perfect Score
                </h5>
                <p className='mt-1 text-xs text-gray-500 dark:text-gray-400'>
                  Ace an exam with 100% accuracy
                </p>
              </div>

              <div className='group rounded-lg bg-white p-4 text-center shadow-md transition-all duration-300 hover:shadow-lg dark:bg-neutral-800'>
                <div className='mx-auto flex h-16 w-16 items-center justify-center rounded-full bg-green-100 transition-transform duration-300 group-hover:scale-110 dark:bg-green-900/30'>
                  <svg
                    xmlns='http://www.w3.org/2000/svg'
                    className='h-8 w-8 text-green-600 dark:text-green-400'
                    fill='none'
                    viewBox='0 0 24 24'
                    stroke='currentColor'
                    data-darkreader-inline-stroke=''
                    styles='--darkreader-inline-stroke: currentColor;'
                  >
                    <path
                      stroke-linecap='round'
                      stroke-linejoin='round'
                      stroke-width='2'
                      d='M16 8v8m-4-5v5m-4-2v2m-2 4h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z'
                    ></path>
                  </svg>
                </div>
                <h5 className='mt-3 text-sm font-semibold text-gray-900 dark:text-white'>
                  Data Explorer
                </h5>
                <p className='mt-1 text-xs text-gray-500 dark:text-gray-400'>
                  Review your stats 20 times
                </p>
              </div>

              <div className='group rounded-lg bg-white p-4 text-center shadow-md transition-all duration-300 hover:shadow-lg dark:bg-neutral-800'>
                <div className='mx-auto flex h-16 w-16 items-center justify-center rounded-full bg-blue-100 transition-transform duration-300 group-hover:scale-110 dark:bg-blue-900/30'>
                  <svg
                    xmlns='http://www.w3.org/2000/svg'
                    className='h-8 w-8 text-blue-600 dark:text-blue-400'
                    fill='none'
                    viewBox='0 0 24 24'
                    stroke='currentColor'
                    data-darkreader-inline-stroke=''
                    styles='--darkreader-inline-stroke: currentColor;'
                  >
                    <path
                      stroke-linecap='round'
                      stroke-linejoin='round'
                      stroke-width='2'
                      d='M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z'
                    ></path>
                  </svg>
                </div>
                <h5 className='mt-3 text-sm font-semibold text-gray-900 dark:text-white'>
                  Social Champion
                </h5>
                <p className='mt-1 text-xs text-gray-500 dark:text-gray-400'>
                  Win 10 challenges against friends
                </p>
              </div>
            </div>
          </div>
        </div>

        <div className='mx-auto mt-20 max-w-5xl rounded-2xl bg-gradient-to-r from-rose-600 to-purple-600 p-8 text-center text-white shadow-xl dark:from-rose-700 dark:to-purple-700'>
          <h3 className='text-2xl font-bold md:text-3xl'>
            Ready to test your knowledge?
          </h3>
          <p className='mt-4 text-lg text-rose-100'>
            Download the app now and start creating your custom exams
          </p>
          <div className='mt-8'>
            <a
              href='#download'
              className='animate__animated animate__pulse animate__infinite animate__slow inline-flex items-center rounded-lg bg-white px-6 py-3 text-base font-medium text-rose-600 shadow-lg transition-transform duration-300 hover:-translate-y-1 hover:shadow-xl'
            >
              Get Started
              <svg
                xmlns='http://www.w3.org/2000/svg'
                className='ml-2 h-5 w-5'
                viewBox='0 0 20 20'
                fill='currentColor'
                data-darkreader-inline-fill=''
                styles='--darkreader-inline-fill: currentColor;'
              >
                <path
                  fill-rule='evenodd'
                  d='M10.293 5.293a1 1 0 011.414 0l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414-1.414L12.586 11H5a1 1 0 110-2h7.586l-2.293-2.293a1 1 0 010-1.414z'
                  clip-rule='evenodd'
                ></path>
              </svg>
            </a>
          </div>
        </div>
      </div>
    </section>
  )
}

export default ExamSection
